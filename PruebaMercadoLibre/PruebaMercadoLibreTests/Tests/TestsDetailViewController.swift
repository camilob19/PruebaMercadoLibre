//
//  TestsDetailViewController.swift
//  PruebaMercadoLibreTests
//
//  Created by Camilo Betancourt on 23/01/21.
//

import XCTest
@testable import PruebaMercadoLibre

class TestsDetailViewController: XCTestCase {
    
    var SUT: DetailViewController?

    override func setUpWithError() throws {
        SUT = DetailViewController(nibName: "DetailViewController", bundle: nil)
        var result = Result()
        result.price = 10000.0
        result.title = "Archivo"
        SUT?.viewModel = ProductViewModel(product: result, repository: FakeMLSearchRepository())
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_Inital_Loading() {
        SUT?.loadViewIfNeeded()
        SUT?.viewDidLoad()
        let tableView = SUT?.tableView
        let indexPath1 = IndexPath(row: 0, section: 0)
        let cell1 = tableView?.dataSource?.tableView(tableView!, cellForRowAt: indexPath1)
        XCTAssertNotNil(cell1 as? HeaderImagesTableViewCell)
        
        let indexPath2 = IndexPath(row: 1, section: 0)
        let cell2 = tableView?.dataSource?.tableView(tableView!, cellForRowAt: indexPath2)
        XCTAssertNotNil(cell2 as? PriceDetailTableViewCell)
        
        let indexPath3 = IndexPath(row: 2, section: 0)
        let cell3 = tableView?.dataSource?.tableView(tableView!, cellForRowAt: indexPath3)
        XCTAssertNotNil(cell3 as? DescriptionTableViewCell)
    }

}
