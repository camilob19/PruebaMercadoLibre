//
//  MLAPI.swift
//  PruebaMercadoLibre
//
//  Created by Camilo Betancourt on 22/01/21.
//

import Foundation

typealias MLListResult = MLResult<ListModel>
typealias MLProductResult = MLResult<Product>
typealias MLDescriptionsResult = MLResult<[Description]>

protocol MLAPIProtocol {
    func search(by keyword: String, completion: @escaping (MLListResult) -> Void)
    func searchDescription(by id: String, completion: @escaping (MLDescriptionsResult) -> Void)
    func searchProduct(by id: String, completion: @escaping (MLProductResult) -> Void)
}

class MLAPI: MLAPIProtocol {
    
    let httpClient: HTTPClient
    let urlFactory = MLListQueryFactory()
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func search(by keyword: String, completion: @escaping (MLListResult) -> Void) {
        guard let url = urlFactory.getListURL(with: keyword) else {
            completion(.failure(.badURL))
            return
        }
        httpClient.request(url: url, completion: completion)
    }
    
    func searchDescription(by id: String, completion: @escaping (MLDescriptionsResult) -> Void) {
        guard let url = urlFactory.getProductDescriptionURL(with: id) else {
            completion(.failure(.badURL))
            return
        }
        httpClient.request(url: url, completion: completion)
    }
    
    func searchProduct(by id: String, completion: @escaping (MLProductResult) -> Void) {
        guard let url = urlFactory.getProductURL(with: id) else {
            completion(.failure(.badURL))
            return
        }
        httpClient.request(url: url, completion: completion)
    }
}

struct MLListQueryFactory {
    
    func getListURL(with q: String) -> String? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.mercadolibre.com"
        components.path = "/sites/MCO/search"
        components.queryItems = [
            URLQueryItem(name: "q", value: q)
        ]
        return components.url?.absoluteString
    }
    
    func getProductURL(with id: String) -> String? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.mercadolibre.com"
        components.path = "/items/\(id)"
        return components.url?.absoluteString
    }
    
    func getProductDescriptionURL(with id: String) -> String? {
        var components = URLComponents()
        components.scheme = "https"
        components.host = "api.mercadolibre.com"
        components.path = "/items/\(id)/descriptions"
        return components.url?.absoluteString
    }
}
