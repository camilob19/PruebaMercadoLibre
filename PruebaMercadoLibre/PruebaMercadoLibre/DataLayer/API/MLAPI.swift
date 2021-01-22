//
//  MLAPI.swift
//  PruebaMercadoLibre
//
//  Created by Camilo Betancourt on 22/01/21.
//

import Foundation

typealias MLListResult = MLResult<ListModel>


class MLAPI {
    
    let httpClient: HTTPClient
    
    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }
    
    func search(by keywork: String, completion:@escaping (MLListResult) -> Void) {
        httpClient.request(url: "", completion: completion)
    }
}
