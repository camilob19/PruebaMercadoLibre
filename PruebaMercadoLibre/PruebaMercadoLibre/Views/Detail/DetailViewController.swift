//
//  DetailViewController.swift
//  PruebaMercadoLibre
//
//  Created by Camilo Betancourt on 23/01/21.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var cells: [Cells] = [.header, .priceDetail, .description]
    
    var viewModel: ProductViewModel!
    
    enum Cells: Int {
        case header = 0
        case priceDetail = 1
        case description = 2
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = Theme.gray
        configTableView()
        
        viewModel.didUpdateImages = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.didUpdateDescription = { [weak self] in
            self?.tableView.reloadData()
        }
        
        viewModel.loadImages()
        viewModel.loadDescriptions()
    }
    
    func configTableView() {
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "HeaderImagesTableViewCell", bundle: nil), forCellReuseIdentifier: "HeaderImagesTableViewCell")
        tableView.register(UINib(nibName: "PriceDetailTableViewCell", bundle: nil), forCellReuseIdentifier: "PriceDetailTableViewCell")
        tableView.register(UINib(nibName: "DescriptionTableViewCell", bundle: nil), forCellReuseIdentifier: "DescriptionTableViewCell")
        tableView.tableFooterView = UIView()
        tableView.separatorStyle = .none
        
        tableView.allowsSelection = false
        
        tableView.rowHeight = UITableView.automaticDimension
    }
    
}

extension DetailViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        switch cells[indexPath.row] {
        case .header:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "HeaderImagesTableViewCell", for: indexPath) as? HeaderImagesTableViewCell else {
                return UITableViewCell()
            }
            
            let images = viewModel.images?.uiImages ?? []
            cell.config(images: images)
            return cell
        case .priceDetail:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "PriceDetailTableViewCell", for: indexPath) as? PriceDetailTableViewCell else {
                return UITableViewCell()
            }
            cell.config(title: viewModel.title, price: viewModel.formattedPrice)
            return cell
        case .description:
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "DescriptionTableViewCell", for: indexPath) as? DescriptionTableViewCell else {
                return UITableViewCell()
            }
            cell.config(description: viewModel.description ?? "")
            return cell
        }
    }
    
}
