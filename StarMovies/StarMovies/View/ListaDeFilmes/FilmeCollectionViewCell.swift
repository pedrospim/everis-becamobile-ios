//
//  FilmeCollectionViewCell.swift
//  StarMovies
//
//  Created by Pedro Spim Costa on 07/01/21.
//  Copyright © 2021 Pedro Spim Costa. All rights reserved.
//

import UIKit

class FilmeCollectionViewCell: UICollectionViewCell {
    
    //MARK: - Outlets
    
    @IBOutlet weak var imageFilme: UIImageView!
    
    @IBOutlet weak var labelTituloFilme: UILabel!
    
    //MARK: -- Variaveis
    
    var viewModel: FilmeCellViewModel = FilmeCellViewModel() 
    
    //Mark: - Funcoes de configuracao
    
    func bind(){
        
        viewModel.viewData.bind { (movieViewData) in
            
            guard let data = movieViewData else { return }
            self.labelTituloFilme.text = data.title
            
            if let imgUrl = data.posterPath {
                if let poster = FilmeAPI().gerarURLImagem(link: imgUrl){
                    self.imageFilme.af_setImage(withURL: poster)
                }
            }
            
        }
}
    
    func aplicarSombrar(){
        self.imageFilme.layer.shadowColor = UIColor.black.cgColor
        self.imageFilme.layer.shadowOpacity = 1
        self.imageFilme.layer.shadowOffset = .zero
        self.imageFilme.layer.shadowRadius = 5
    }
    
} 
