//
//  FakeMLAPI.swift
//  PruebaMercadoLibreTests
//
//  Created by Camilo Betancourt on 23/01/21.
//

import Foundation
@testable import PruebaMercadoLibre

class FakeMLAPI: MLAPIProtocol {
    
    func search(by keyword: String, completion: @escaping (MLListResult) -> Void) {
        let api = HttpClientFake()
        api.request(url: "https://api.mercadolibre.com/sites/MCO/search?q=celulares", completion: completion)
    }
    
    func searchDescription(by id: String, completion: @escaping (MLDescriptionsResult) -> Void) {
        let api = HttpClientFake()
        api.request(url: "https://api.mercadolibre.com/items/MCO551389083/descriptions", completion: completion)
        
    }
    
    func searchProduct(by id: String, completion: @escaping (MLProductResult) -> Void) {
        let api = HttpClientFake()
        api.request(url: "https://api.mercadolibre.com/items/ID-Falso", completion: completion)
    }
}
