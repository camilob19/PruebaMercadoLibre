//
//  TestsSearchViewController.swift
//  PruebaMercadoLibreTests
//
//  Created by Camilo Betancourt on 23/01/21.
//

import XCTest
@testable import PruebaMercadoLibre
class TestsSearchViewController: XCTestCase {
    
    var SUT: SearchViewController?

    override func setUpWithError() throws {
        let vm = SearchViewModel(repository: FakeMLSearchRepository())
        SUT = SearchViewController(viewModel: vm)
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_initial_Load() {
        SUT?.loadViewIfNeeded()
        SUT?.viewDidLoad()
        SUT?.viewModel.search(by: "demo")
        let tableView = SUT?.tableView
        let indexPath1 = IndexPath(row: 0, section: 0)
        let cell1 = tableView?.dataSource?.tableView(tableView!, cellForRowAt: indexPath1)
        XCTAssertNotNil(cell1 as? SearchTableViewCell)
    }


}
