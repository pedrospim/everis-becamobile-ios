//
//  Converter.swift
//  StarMovies
//
//  Created by Pedro Spim Costa on 12/01/21.
//  Copyright © 2021 Pedro Spim Costa. All rights reserved.
//

import Foundation

class Converter : NSObject {
    
    let currencyFormatter = NumberFormatter()
    
    func ConverterParaDolares(_ valor: Int) -> String{
    currencyFormatter.usesGroupingSeparator = true
    currencyFormatter.numberStyle =  .currency
    currencyFormatter.currencySymbol = "$"
    
        if valor == 0 {
            return "Desconhecido"
        }else{
            let valorFormatado = NSNumber(integerLiteral: valor)
            
            if let valorFinal = currencyFormatter.string(from: valorFormatado) {
                print(valorFinal)
                return "\(valorFinal)"
            }
        }
        return "Desconhecido"
    }
}
