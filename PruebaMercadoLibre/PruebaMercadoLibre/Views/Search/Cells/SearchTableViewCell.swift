//
//  SearchTableViewCell.swift
//  PruebaMercadoLibre
//
//  Created by Camilo Betancourt on 23/01/21.
//

import UIKit
import AlamofireImage
import Alamofire

class SearchTableViewCell: UITableViewCell {

    @IBOutlet weak var productTitleLabel: UILabel!
    @IBOutlet weak var productImage: UIImageView!
    @IBOutlet weak var productPriceLabel: UILabel!
    @IBOutlet weak var productStatePlaceLabel: UILabel!
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func config(product: ProductViewModel) {
        AF.request(product.imageURL).responseImage { [weak self] response in
            if case .success(let image) = response.result {
                self?.productImage.image = image
            }
        }
        
        productTitleLabel.text = product.title
        productPriceLabel.text = product.formattedPrice
        productStatePlaceLabel.text = product.place
    }
    
}
