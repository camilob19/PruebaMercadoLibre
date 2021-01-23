//
//  HttpClientFake.swift
//  PruebaMercadoLibreTests
//
//  Created by Camilo Betancourt on 22/01/21.
//

import Foundation
@testable import PruebaMercadoLibre

class HttpClientFake: HTTPClient {
    func request<T>(url: String, completion: @escaping (MLResult<T>) -> Void) where T : Decodable, T : Encodable {
        loadStub(validateUrl: "https://api.mercadolibre.com/sites/MCO/search?q=celulares",
                 url: url,
                 fileName: "MLList",
                 type: T.self,
                 completion: completion)
        
        loadStub(validateUrl: "https://api.mercadolibre.com/items/ID-Falso",
                 url: url,
                 fileName: "productDetail",
                 type: T.self,
                 completion: completion)
        
        loadStub(validateUrl: "https://api.mercadolibre.com/items/MCO551389083/descriptions",
                 url: url,
                 fileName: "descriptions",
                 type: T.self,
                 completion: completion)
    }
    
    
    
    private func loadJson<T: Codable>(fileName: String, type: T.Type) -> T? {
        let decoder = JSONDecoder()
        guard
            let url = Bundle(for: HttpClientFake.self).url(forResource: fileName, withExtension: "json")
            else {
                return nil
        }
        
        do {
            let data = try Data(contentsOf: url)
            let location = try decoder.decode(type, from: data)
            return location
        } catch {
            print(error)
        }
        
        return nil
    }
    
    private func loadStub<T: Codable>(validateUrl: String, url: String, fileName: String, type: T.Type, completion: @escaping (MLResult<T>) -> Void) {
        guard validateUrl == url  else {
            return
        }
        
        guard let stubResult = loadJson(fileName: fileName, type: type) else {
            completion(.failure(.serviceError))
            return
        }
        
        completion(.success(stubResult))
    }
    
    
}

