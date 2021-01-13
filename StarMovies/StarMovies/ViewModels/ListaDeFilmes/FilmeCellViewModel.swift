//
//  FilmeCellViewModel.swift
//  StarMovies
//
//  Created by Pedro Spim Costa on 13/01/21.
//  Copyright © 2021 Pedro Spim Costa. All rights reserved.
//

import Foundation

class FilmeCellViewModel {
    
    // MARK: - Properts
    //private let client: FilmeAPIProtocol
    var viewData: Bindable<ResultadoFilme?> = Bindable(nil)
    //var delegate: DetalhesFilmeViewModelDelegate?
    
    // MARK: - Constructors
    //init(filme:ResultadoFilme){
    //    self.viewData.value = filme
    //}
    func setarViewData(filme:ResultadoFilme){
        self.viewData.value = filme
    }
    // MARK: - Methods
    
}
