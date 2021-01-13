//
//  TendenciasViewData.swift
//  StarMovies
//
//  Created by Pedro Spim Costa on 13/01/21.
//  Copyright © 2021 Pedro Spim Costa. All rights reserved.
//

import Foundation

protocol TendenciasViewDataType {
    var resultados: [ResultadoFilme] { get }
}

class TendenciasViewData : NSObject {
    
    private let model:TendenciasModel
    
    init(model: TendenciasModel){
        self.model = model
    }
    
}

extension TendenciasViewData : TendenciasViewDataType {
    
    var resultados: [ResultadoFilme] {
        guard let resultados = model.results else { return []}
        return resultados
    }

}
