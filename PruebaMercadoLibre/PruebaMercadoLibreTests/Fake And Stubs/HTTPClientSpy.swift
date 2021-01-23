//
//  HTTPClientSpy.swift
//  PruebaMercadoLibreTests
//
//  Created by Camilo Betancourt on 22/01/21.
//

import Foundation
@testable import PruebaMercadoLibre

class HttpClientSpy: HTTPClient {
    func request<T>(url: String, completion: @escaping (MLResult<T>) -> Void) where T : Decodable, T : Encodable {
        
        guard url == "https://api.mercadolibre.com/sites/MCO/search?q=celular%C3%A9s%20para%20%C3%B1o%C3%B1os" else {
            completion(.failure(.serviceError))
            return
        }
        
        guard let stubResult = loadJson(fileName: "MLList", type: T.self) else {
            completion(.failure(.serviceError))
            return
        }
        
        completion(.success(stubResult))
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
}


