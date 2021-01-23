//
//  PriceDetailTableViewCell.swift
//  PruebaMercadoLibre
//
//  Created by Camilo Betancourt on 23/01/21.
//

import UIKit

class PriceDetailTableViewCell: UITableViewCell {

    @IBOutlet weak var priceLabel: UILabel!
    @IBOutlet weak var productTitleLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        backgroundColor = Theme.gray
        // Initialization code
    }
    
    func config(title: String, price: String) {
        priceLabel.text = price
        productTitleLabel.text = title
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
