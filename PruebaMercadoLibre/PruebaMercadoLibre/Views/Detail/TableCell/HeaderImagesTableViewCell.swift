//
//  HeaderImagesTableViewCell.swift
//  PruebaMercadoLibre
//
//  Created by Camilo Betancourt on 23/01/21.
//

import UIKit

class HeaderImagesTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView!
    var images: [UIImage?] = []
    override func awakeFromNib() {
        super.awakeFromNib()
        configureCollectionView()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func config(images: [UIImage?]) {
        self.images = images
        self.collectionView.reloadData()
    }
    
    func configureCollectionView() {
        collectionView.delegate = self
        collectionView.dataSource = self
        
        collectionView.register(UINib(nibName: "ProductImageViewCell", bundle: nil), forCellWithReuseIdentifier: "ProductImageViewCell")
    }
}

extension HeaderImagesTableViewCell: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return images.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProductImageViewCell", for: indexPath) as? ProductImageViewCell else {
            return UICollectionViewCell()
        }
        
        cell.productImage.image = images[indexPath.row]
        return cell
    }
    
    
}

extension HeaderImagesTableViewCell: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.collectionView.frame.width, height: self.collectionView.frame.height)
    }
}
