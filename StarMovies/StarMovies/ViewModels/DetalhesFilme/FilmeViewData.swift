//
//  MainViewData.swift
//  StarMovies
//
//  Created by Pedro Spim Costa on 12/01/21.
//  Copyright © 2021 Pedro Spim Costa. All rights reserved.
//

import Foundation

protocol FilmeViewDataType {
    var title: String { get }
    var tagline: String { get }
    var releaseDate: String { get }
    var budget: String { get }
    var revenue: String { get }
    var generos: String { get }
    var sinopse: String { get }
    var nota: String { get }
    var caminhoImagemPoster : String { get }
    var caminhoImagemBg : String { get }
}

class FilmeViewData : NSObject {
    
    private let model:FilmeModel
    
    init(model: FilmeModel){
        self.model = model
    }
    
}

extension FilmeViewData : FilmeViewDataType {
    
    var tagline: String {
        guard let tagline = model.tagline else {  return ""}
        return tagline
    }
    
    var nota: String {
        guard var nota = model.voteAverage else { return "Desconhecido"}
        nota = nota * 10
        nota = Double(nota).rounded()
        nota = nota / 10
        return String(nota)
    }
    
    var title: String {
        guard let titulo = model.title else { return ""}
        return titulo
    }
    
    var releaseDate: String {
        guard let data = model.releaseDate else { return ""}
        return data
    }
    
    var budget: String {
        
        guard let budget = model.budget else { return "Desconhecido"}
        return Converter().ConverterParaDolares(budget)
    }
    
    var revenue: String {
        guard let revenue = model.revenue else { return "Desconhecido"}
        return Converter().ConverterParaDolares(revenue)
    }
    
    var generos: String {
        guard let generos = model.genres else { return ""}
        var generosString = ""
        for genero in generos {
            guard let nomeGenero = genero.name else { return ""}
            generosString.append("\(nomeGenero)  ")
        }
        return generosString
    }
    
    var sinopse: String {
        guard let sinopse = model.overview else { return ""}
        return sinopse
    }
    
    var caminhoImagemPoster: String {
        guard let caminho = model.posterPath else { return ""}
        return caminho
    }
    
    var caminhoImagemBg: String {
        guard let caminho = model.backdropPath else { return ""}
        return caminho
    }
    
}
