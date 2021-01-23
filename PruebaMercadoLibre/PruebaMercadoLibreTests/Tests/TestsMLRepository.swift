//
//  TestsMLRepository.swift
//  PruebaMercadoLibreTests
//
//  Created by Camilo Betancourt on 23/01/21.
//

import XCTest
@testable import PruebaMercadoLibre

class TestsMLRepository: XCTestCase {
    
    var SUT: MLSearchRepository?

    override func setUpWithError() throws {
        SUT = MLSearchRepository(api: FakeMLAPI())
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func test_search_list() {
        SUT?.search(by: "", completion: { result in
            switch result {
            case .success(let arrayModels):
                XCTAssertEqual(arrayModels.count, 50)
            case .failure:
                XCTFail("Shouldn't be here")
            }
        })
    }
    
    func test_search_product() {
        SUT?.searchProduct(by: "", completion: { result in
            switch result {
            case .success(let imageViewModel):
                XCTAssertEqual(imageViewModel.images.count, 7)
                XCTAssertEqual(imageViewModel.uiImages.count, 0)
            case .failure:
                XCTFail("Shouldn't be here")
            }
        })
    }
    
    func test_search_description() {
        SUT?.searchDescription(by: "", completion: { result in
            switch result {
            case .success(let description):
                XCTAssertEqual(description, "Este se debe mostrar")
            case .failure:
                XCTFail("Shouldn't be here")
            }
        })
    }

}
