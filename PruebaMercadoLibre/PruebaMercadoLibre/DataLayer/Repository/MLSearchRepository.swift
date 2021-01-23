//
//  MLSearchRepository.swift
//  PruebaMercadoLibre
//
//  Created by Camilo Betancourt on 22/01/21.
//

import Foundation

typealias MLViewListResult = MLResult<[ProductViewModel]>
typealias MLViewProductResult = MLResult<PicturesImagesViewModel>
typealias MLViewDescriptionResult = MLResult<String>

protocol MLSearchRepositoryProtocol {
    func search(by keyword: String, completion:@escaping (MLViewListResult) -> Void)
    func searchProduct(by id: String, completion: @escaping (MLViewProductResult) -> Void)
    func searchDescription(by id: String, completion: @escaping (MLViewDescriptionResult) -> Void)
}

class MLSearchRepository: MLSearchRepositoryProtocol {
    
    let api: MLAPIProtocol
    
    init(api: MLAPIProtocol) {
        self.api = api
    }
    
    func search(by keyword: String, completion:@escaping (MLViewListResult) -> Void) {
        api.search(by: keyword) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let listModel):
                guard let models = listModel.results else {
                    completion(.failure(.emptyResults))
                    return
                }
                
                let viewModels = models.map { product -> ProductViewModel in
                    return ProductViewModel(product: product, repository: self)
                }
                
                completion(.success(viewModels))
            case .failure(let error):
                completion(.failure(error))
            }
            
        }
    }
    
    func searchProduct(by id: String, completion: @escaping (MLViewProductResult) -> Void) {
        api.searchProduct(by: id) { result in
            switch result {
            case .success(let product):
                var images: [String] = []
                product.pictures.forEach { picture in
                    images.append(picture.url)
                }
                completion(.success(PicturesImagesViewModel(images: images)))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
    func searchDescription(by id: String, completion: @escaping (MLViewDescriptionResult) -> Void) {
        api.searchDescription(by: id) { result in
            switch result {
            case .success(let descriptions):
                let description = descriptions.first?.plainText ?? ""
                completion(.success(description))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
