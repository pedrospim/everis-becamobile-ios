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
        
        for indice in 1...4 {
            FilmeAPI().pegarListaTendenciasFilmes(pagina: indice) { (resposta) in
                let viewData: Bindable<TendenciasViewData?> = Bindable(nil)
                viewData.value = TendenciasViewData(model: resposta)
                
                XCTAssertEqual(viewData.value?.resultados.count, 20)
                if indice == 3 {
                    expectation.fulfill()
                }
            }
        }
        self.waitForExpectations(timeout: 15)
    }

    func testExample() throws {

    }
    
    func testDetalhesFilmes(){
        let expectation = self.expectation(description: "Uma descricao")
        FilmeAPI().pegarDetalhesFilme(codFilme: 464052) { (resposta) in
            let viewData: Bindable<FilmeViewData?> = Bindable(nil)
            viewData.value = FilmeViewData(model: resposta)
            
            XCTAssertEqual(464052, resposta.id)
            XCTAssertEqual("Mulher-Maravilha 1984", viewData.value?.title)
            XCTAssertEqual("$200,000,000.00", viewData.value?.budget)
            expectation.fulfill()
        }
        self.waitForExpectations(timeout: 5)
    }
    

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
