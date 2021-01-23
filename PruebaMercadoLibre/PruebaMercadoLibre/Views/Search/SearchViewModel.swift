//
//  SearchViewModel.swift
//  PruebaMercadoLibre
//
//  Created by Camilo Betancourt on 23/01/21.
//

import Foundation

class SearchViewModel {
    
    var didUpdateResults: (() -> Void)?
    var didFailResults: (() -> Void)?
    
    var models: [ProductViewModel] = []
    var repository: MLSearchRepositoryProtocol
    
    init(repository: MLSearchRepositoryProtocol) {
        self.repository = repository
    }
    
    func search(by keyword: String) {
        repository.search(by: keyword) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let models):
                self.models = models
                self.didUpdateResults?()
            case .failure(let error):
                self.didFailResults?()
                print("Error \(error)")
            }
        }
    }
}
