//
//  TendenciasViewModel.swift
//  StarMovies
//
//  Created by Pedro Spim Costa on 13/01/21.
//  Copyright © 2021 Pedro Spim Costa. All rights reserved.
//

import Foundation

//protocol DetalhesFilmeViewModelDelegate {
//    func reloadData(filme: FilmeViewData)
//}

class TendenciasViewModel {
    
    // MARK: - Properts
    private let client: FilmeAPIProtocol
    var viewData: Bindable<TendenciasViewData?> = Bindable(nil)
    //var delegate: DetalhesFilmeViewModelDelegate?
    
    // MARK: - Constructors
    init(client: FilmeAPIProtocol = FilmeAPI()) {
        self.client = client
    }
    
    // MARK: - Methods
    func loadTendencias(pagina: Int) {
        client.pegarListaTendenciasFilmes(pagina: pagina) { (tendencias) in
            self.viewData.value = TendenciasViewData(model: tendencias)
        }
    }
    
}
