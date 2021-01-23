//
//  SearchViewController.swift
//  PruebaMercadoLibre
//
//  Created by Camilo Betancourt on 22/01/21.
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var emptyResultsLabel: UILabel!
    lazy var searchBar: UISearchBar = UISearchBar(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: 20))
    
    var viewModel: SearchViewModel
    
    // MARK: Injection
    init(viewModel: SearchViewModel) {
        self.viewModel = viewModel
        super.init(nibName: "SearchViewController", bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: LifeCycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configViewModel()
        configUI()
    }
    
    func configViewModel() {
        viewModel.didUpdateResults = { [weak self] in
            if self?.viewModel.models.count == 0 && self?.searchBar.text != "" {
                self?.emptyResultsLabel.isHidden = false
            } else {
                self?.emptyResultsLabel.isHidden = true
            }
            self?.tableView.reloadData()
        }
    }
    
    
    // MARK: UI Configuration
    func configUI() {
        searchBar.placeholder = "Busca Aquí"
        searchBar.delegate = self
        searchBar.showsCancelButton = true
        let leftNavBarButton = UIBarButtonItem(customView: searchBar)
        self.navigationItem.leftBarButtonItem = leftNavBarButton
        navigationController?.navigationBar.backgroundColor = Theme.mainColor
        navigationController?.navigationBar.barTintColor = Theme.mainColor
        UIBarButtonItem.appearance(whenContainedInInstancesOf:[UISearchBar.self]).tintColor = UIColor.black
        configTable()
    }
    
    func configTable() {
        tableView.register(UINib(nibName: "SearchTableViewCell", bundle: nil), forCellReuseIdentifier: "SearchTableViewCell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.tableFooterView = UIView()
        tableView.rowHeight = 120
    }

}

extension SearchViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        viewModel.search(by: searchText)
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchBar.text = ""
    }
}

extension SearchViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.models.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "SearchTableViewCell", for: indexPath) as? SearchTableViewCell else {
            return UITableViewCell()
        }
        cell.config(product: viewModel.models[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Cargar nueva vista de detalle
        let controller = DetailViewController(nibName: "DetailViewController", bundle: nil)
        controller.viewModel = viewModel.models[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
    }
}
