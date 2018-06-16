//
//  RESTClient+DataTask.swift
//  Swift 4.0
//  Created by Kyle Ishie, Kyle Ishie Development.
//


import Foundation

extension RESTClient {
    
    /**
     Creates a URLDataTask with a preset completion handler capable of decoding the response's body per it's Content-Type header.
     
     Note that this method requires a response body for successful requests.  If it is possible for the body to be nil use dataTask<T : Codable & ExpressibleByNilLiteral>(_:, with:, completionHandler:).
     */
    open func dataTask<T : Decodable>(_ type: T.Type, with request: URLRequest, completionHandler: ((Result<T, Error>) -> Void)? = nil) -> URLSessionDataTask {
        return dataTask(T?.self, with: request, completionHandler: { result in
            switch result {
            case let .success(decoded):
                guard let decoded = decoded else {
                    fatalError("Successful data task decoded nil for expected non-optional type \(type).")
                }
                completionHandler?(.success(decoded))
                
            case let .failure(status, error):
                completionHandler?(.failure(status, error))
                
            case let .systemFailure(error):
                completionHandler?(.systemFailure(error))
            }
        })
    }
    
    /**
     Creates a URLDataTask with a preset completion handler capable of decoding the response's body per it's Content-Type header.
     
     This method allows for the poosibility of a nil response body when the request is successful, however, additional unwrapping is required.
     */
    open func dataTask<T : Decodable & ExpressibleByNilLiteral>(_ type: T.Type, with request: URLRequest, completionHandler: ((Result<T, Error>) -> Void)? = nil) -> URLSessionDataTask {
        
        var request = request
        transformers.forEach({ $0.tranform(&request) })
        
        return session.dataTask(with: request) { [decoders] (data, response, error) in
            
            guard let response = response as? HTTPURLResponse else {
                completionHandler?(.systemFailure(error!))
                return
            }
            
            guard let contentType = response.contentType else {
                completionHandler?(.success(nil))
                return
            }
            
            guard let decoder = decoders[contentType] else {
                fatalError("Unable to determine decoder for response content-type")
            }
            
            guard let data = data else {
                completionHandler?(.success(nil))
                return
            }
            
            do {
                
                try response.validate()
                
                let decoded = try decoder.decode(T.self, from: data)
                completionHandler?(.success(decoded))
                
            } catch HTTPURLResponseError.unacceptableStatus(let status) {
                
                do {
                    
                    let decodedAPIError = try decoder.decode(Error.self, from: data)
                    completionHandler?(.failure(status, decodedAPIError))
                    
                } catch {
                    
                    completionHandler?(.systemFailure(error))
                    
                }
                
            } catch {
                
                completionHandler?(.systemFailure(error))
                
            }
        }
    }
    
    /**
        Creates and Performs a URLSessionDataTask with a preset completion handler capable of decoding the response's body per it's Content-Type header.
     
        Note that this method blocks until the task completes and calls it's completion handler at which time a value may be returned or an error may be thrown.
    */
    open func performSyncDataTask<T : Decodable>(_ type: T.Type, with request: URLRequest) throws -> T? {
        
        var res : Result<T, Error>? = nil
        
        let semaphore = DispatchSemaphore(value: 0)
        
        let task = dataTask(T.self, with: request) { r in
            defer { semaphore.signal() }
            res = r
        }
        
        task.resume()
        semaphore.wait()
        
        guard let result = res else {
            return nil
        }
        
        guard case let .success(object) = result else {
            guard case let .failure(status, error) = result else {
                return nil
            }
            print("Status --> \(status)")
            throw error
        }
        
        return object
    }
    
}

