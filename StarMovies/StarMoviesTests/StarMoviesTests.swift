//
//  StarMoviesTests.swift
//  StarMoviesTests
//
//  Created by Pedro Spim Costa on 18/01/21.
//  Copyright © 2021 Pedro Spim Costa. All rights reserved.
//

import XCTest
@testable import StarMovies

class StarMoviesTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testQuantidadeFilmes(){
        
        let expectation = self.expectation(description: "Uma descricao")
        
        FilmeAPI().pegarListaTendenciasFilmes(pagina: 1) { (resposta) in
            XCTAssertEqual(resposta.results?.count, 20)
            expectation.fulfill()
        }
        
        self.waitForExpectations(timeout: 5)
    }

    func testExample() throws {

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
