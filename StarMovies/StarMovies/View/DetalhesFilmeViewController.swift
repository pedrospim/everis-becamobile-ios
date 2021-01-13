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
    
    var codFilme:Int?
    let viewModel: FilmeDetalhesViewModel = FilmeDetalhesViewModel()
    
    //MARK: - Funcoes
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //viewModel.delegate = self
        bind()
        if let id = codFilme {
            viewModel.loadMovie(codFilme: id)
        }
        
        
        labelGenero.adjustsFontSizeToFitWidth = true
        labelBudget.adjustsFontSizeToFitWidth = true
        labelRevenue.adjustsFontSizeToFitWidth = true
        
    }
    
    func bind(){
        viewModel.viewData.bind { (movieViewData) in
            guard let `movieViewData` = movieViewData else { return }
            self.labelTitulo.text = movieViewData.title
            self.labelNota.text = movieViewData.nota
            self.labelTagline.text = movieViewData.tagline
            self.labelRevenue.text = movieViewData.revenue
            self.labelBudget.text = movieViewData.budget
            self.labelSinopse.text = movieViewData.sinopse
            self.labelGenero.text = movieViewData.generos
            self.labelData.text = movieViewData.releaseDate
            
            if let imageUrlBg = FilmeAPI().gerarURLImagem(link: movieViewData.caminhoImagemBg) {
                self.imageBackground.af_setImage(withURL: imageUrlBg)
            }
            
            if let imageUrl = FilmeAPI().gerarURLImagem(link: movieViewData.caminhoImagemPoster) {
                self.imagePoster.af_setImage(withURL: imageUrl)
                }
        }
    }
    
    @IBAction func buttonFecharDetalhes(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}

//extension DetalhesFilmeViewController: DetalhesFilmeViewModelDelegate {
//
//    func reloadData(filme: FilmeViewData) {
//        self.labelTitulo.text = filme.title
//    }
//}
