//
//  DetalhesFilmeViewModel.swift
//  StarMovies
//
//  Created by Pedro Spim Costa on 12/01/21.
//  Copyright © 2021 Pedro Spim Costa. All rights reserved.
//

import Foundation

protocol DetalhesFilmeViewModelDelegate {
    func reloadData(filme: FilmeViewData)
}

class FilmeDetalhesViewModel {
    
    // MARK: - Properts
    private let client: FilmeAPIProtocol
    var viewData: Bindable<FilmeViewData?> = Bindable(nil)
    var delegate: DetalhesFilmeViewModelDelegate?
    
    // MARK: - Constructors
    init(client: FilmeAPIProtocol = FilmeAPI()) {
        self.client = client
    }
    
    // MARK: - Methods
    func loadMovie() {
        client.pegarDetalhesFilme(codFilme: 464052) { (filme) in
            self.delegate?.reloadData(filme: FilmeViewData(model: filme))
        }
    }
    
}
