//
//  AFHttpClient.swift
//  PruebaMercadoLibre
//
//  Created by Camilo Betancourt on 22/01/21.
//

import Foundation
import Alamofire

class AFHTTPClient: HTTPClient {
        
    func parse<T>(data: Data, type: T.Type, completion: @escaping (RedAmarillaResult<T>) -> Void) where T: Codable {
        do {
            let json = try JSONDecoder().decode(T.self, from: data)
            completion(.success(json))
            
        } catch {
            print("[Error parsing]")
            print(error)
            completion(.failure(.errorParser))
        }
    }
    
    func request<T: Codable>(url: String, completion: @escaping (RedAmarillaResult<T>) -> Void) {
        AF.request(url).response { response in
            switch response.result {
            case .success(let data):
                guard let data = data else {
                    completion(.failure(.errorParser))
                    return
                }
                self.parse(data: data, type: T.self, completion: completion)
            case .failure:
                completion(.failure(.serviceError))
            }
        }.validate()
        
    }
}
