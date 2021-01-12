//
//  DetalhesFilmeViewController.swift
//  StarMovies
//
//  Created by Pedro Spim Costa on 07/01/21.
//  Copyright © 2021 Pedro Spim Costa. All rights reserved.
//

import UIKit
import Alamofire
import AlamofireImage

class DetalhesFilmeViewController: UIViewController {
    
    //MARK: - Outlets

    @IBOutlet weak var imageBackground: UIImageView!
    
    @IBOutlet weak var labelTitulo: UILabel!
    
    @IBOutlet weak var labelTagline: UILabel!
    
    @IBOutlet weak var labelData: UILabel!
    
    @IBOutlet weak var labelBudget: UILabel!
    
    @IBOutlet weak var labelRevenue: UILabel!
    
    @IBOutlet weak var labelGenero: UILabel!
    
    @IBOutlet weak var labelSinopse: UITextView!
    
    @IBOutlet weak var imagePoster: UIImageView!
    
    @IBOutlet weak var labelNota: UILabel!
    
    //MARK: - Variaveis
    
    var filmeSelecionado:FilmeModel?
    
    let viewModel: FilmeDetalhesViewModel = FilmeDetalhesViewModel()
    
    //MARK: - Funcoes
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewModel.delegate = self
        bind()
        viewModel.loadMovie()
        
        
        if let filme = filmeSelecionado {
            
            labelTitulo.text = filme.title
            labelNota.text = String(describing: filme.voteAverage)
            
            labelTagline.text = filme.tagline
            labelData.text = filme.releaseDate
            //labelBudget.text = filme.getBudgetFormatado()
            //labelRevenue.text = filme.getRevenueFormatado()
            //labelGenero.text = filme.generos
            labelSinopse.text = filme.overview
            
            if let caminhoPoster = filme.posterPath {
                if let imageUrl = FilmeAPI().gerarURLImagem(link: caminhoPoster) {
                        imagePoster.af_setImage(withURL: imageUrl)
                    }
            }
            
            if let caminhoBg = filme.backdropPath {
                if let imageUrlBg = FilmeAPI().gerarURLImagem(link: caminhoBg) {
                    imageBackground.af_setImage(withURL: imageUrlBg)
                }
                
            }
            
        }
        
        labelGenero.adjustsFontSizeToFitWidth = true
        labelBudget.adjustsFontSizeToFitWidth = true
        labelRevenue.adjustsFontSizeToFitWidth = true
        
    }
    
    func bind(){
        viewModel.viewData.bind { (movieViewData) in
            guard let `movieViewData` = movieViewData else { return }
            self.labelTitulo.text = movieViewData.title
        }
    }
    
    @IBAction func buttonFecharDetalhes(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

extension DetalhesFilmeViewController: DetalhesFilmeViewModelDelegate {
    
    func reloadData(filme: FilmeViewData) {
        self.labelTitulo.text = filme.title
    }
}
