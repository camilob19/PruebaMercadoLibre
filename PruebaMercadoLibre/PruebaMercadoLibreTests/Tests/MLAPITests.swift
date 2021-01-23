//
//  MLAPITests.swift
//  PruebaMercadoLibreTests
//
//  Created by Camilo Betancourt on 22/01/21.
//

import XCTest
@testable import PruebaMercadoLibre

class MLAPITests: XCTestCase {
    
    var SUT: MLAPI!

    override func setUpWithError() throws {
    }

    override func tearDownWithError() throws {
    }
    
    func test_Api_Calls_Http_And_Parse() {
        SUT = MLAPI(httpClient: HttpClientFake())
        SUT.search(by: "celulares") { result in
            switch result {
            case .success(let model):
                XCTAssertEqual(model.results?.count, 50)
            case .failure:
                XCTFail("Shouldn't be here")
            }
        }
    }
    
    func test_Api_Calls_Http_And_Parse_With_Complex_Query() {
        SUT = MLAPI(httpClient: HttpClientSpy())
        SUT.search(by: "celularés para ñoños") { result in
            switch result {
            case .success(let model):
                XCTAssertEqual(model.results?.count, 50)
            case .failure:
                XCTFail("Shouldn't be here")
            }
        }
    }
    
    func test_Api_Calls_Http_Product_Images() {
        SUT = MLAPI(httpClient: HttpClientFake())
        SUT.searchProduct(by: "ID-Falso") { result in
            switch result {
            case .success(let product):
                XCTAssertEqual(product.pictures.count, 7)
            case .failure:
                XCTFail("Shouldn't be here")
            }
        }
    }
    
    func test_Api_Calls_Http_Product_Descriptions() {
        SUT = MLAPI(httpClient: HttpClientFake())
        SUT.searchDescription(by: "MCO551389083") { result in
            switch result {
            case .success(let descriptions):
                XCTAssertEqual(descriptions.count, 3)
            case .failure:
                XCTFail("Shouldn't be here")
            }
        }
    }

}
