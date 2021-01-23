//
//  ProductViewModel.swift
//  PruebaMercadoLibre
//
//  Created by Camilo Betancourt on 23/01/21.
//

import Foundation
import UIKit
import Alamofire
import AlamofireImage

class ProductViewModel {
    
    var productId: String
    var title: String
    var imageURL: String
    var price: Double
    var place: String
    var description: String?
    
    var didUpdateImages: (() -> Void)?
    var didUpdateDescription: (() -> Void)?
    
    var repository: MLSearchRepositoryProtocol
    var images: PicturesImagesViewModel? {
        didSet {
            bindingViewModel()
            images?.loadImages()
        }
    }
    
    init(product: Result, repository: MLSearchRepositoryProtocol) {
        
        self.repository = repository
        
        self.title = product.title ?? ""
        self.price = product.price ?? 0
        self.imageURL = product.thumbnail ?? ""
        self.place = product.address?.stateName ?? ""
        self.productId = product.id ?? ""
    }
    
    var formattedPrice: String {
        let formatter = NumberFormatter()
        formatter.locale = Locale(identifier: "es_CO")
        formatter.numberStyle = .currency
        formatter.alwaysShowsDecimalSeparator = false
        formatter.perMillSymbol = "."
        if let format = formatter.string(from: NSNumber(value: price)) {
            return format
        }
        return ""
    }
    
    func bindingViewModel() {
        images?.didUpdateImages = { [weak self] in
            self?.didUpdateImages?()
        }
    }
    
    func loadImages() {
        repository.searchProduct(by: productId) { [weak self] result in
            switch result {
            case .success(let imagesModel):
                self?.images = imagesModel
            case .failure(let error):
                print("Error \(error)")
            }
        }
    }
    
    func loadDescriptions() {
        repository.searchDescription(by: productId) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let description):
                self.description = description
                self.didUpdateDescription?()
            case .failure(let error):
                print("Error \(error)")
            }
        }
    }
}

class PicturesImagesViewModel {
    
    var images: [String]
    var uiImages: [UIImage] = []
    
    var didUpdateImages: (() -> Void)?
    
    init(images: [String]) {
        self.images = images
    }
    
    func loadImages() {
        let group = DispatchGroup()
        
        images.forEach { image in
            group.enter()
            AF.request(image).responseImage { [weak self] response in
                if case .success(let image) = response.result {
                    self?.uiImages.append(image)
                }
                group.leave()
            }
        }
        
        group.notify(queue: DispatchQueue.main) { [weak self] in
            self?.didUpdateImages?()
        }
    }
}
