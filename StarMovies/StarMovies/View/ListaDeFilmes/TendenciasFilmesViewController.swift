//
//  TendenciasFilmesViewController.swift
//  StarMovies
//
//  Created by Pedro Spim Costa on 07/01/21.
//  Copyright © 2021 Pedro Spim Costa. All rights reserved.
//

import UIKit
import AlamofireImage

class TendenciasFilmesViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate  , UICollectionViewDelegateFlowLayout{
    
    //MARK: - Outlets
    
    @IBOutlet weak var colecaoFilmes: UICollectionView!
    
    
    
    //MARK: - Variaveis
    
    var listaTendenciaFilmes:[ResultadoFilme] = []
    
    var paginaAtual = 1
    
    var buttonAnterior:UIButton?
    let viewModel: TendenciasViewModel = TendenciasViewModel()
    
    //MARK: - LifeCycle

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.colecaoFilmes.dataSource = self
        self.colecaoFilmes.delegate = self
        
        
        bind()
        viewModel.loadTendencias(pagina: paginaAtual)

    }
    
    
    func bind(){
        
        viewModel.viewData.bind { (movieViewData) in
            
            guard let `movieViewData` = movieViewData else { return }
            self.listaTendenciaFilmes = movieViewData.resultados
            self.colecaoFilmes.reloadData()
        }
        
    }
    //MARK: - CollectionViewDataSource
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return listaTendenciaFilmes.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        guard let celula = collectionView.dequeueReusableCell(withReuseIdentifier: "celulaFilme", for: indexPath) as? FilmeCollectionViewCell else { return UICollectionViewCell()}
        celula.bind()
        celula.viewModel.setarViewData(filme: listaTendenciaFilmes[indexPath.row])
        celula.aplicarSombrar()
    
        return celula
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let height = view.frame.size.height
        let width = view.frame.size.width
        
        let dimensaoDaTela = Int(height/width)

        if dimensaoDaTela < 2 {
            
        return CGSize(width: width * 0.43, height: height * 0.43)
        }else{
        return CGSize(width: width * 0.43, height: height * 0.37)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        if kind == UICollectionView.elementKindSectionFooter {
            guard let view = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "CollectionReusableView", for: indexPath) as? FilmesFooterCollectionReusableView else { return UICollectionReusableView()}
            
            self.buttonAnterior = view.buttonAnterior
            
            if paginaAtual == 1 {
            self.buttonAnterior?.isHidden = true
            }
            
            return view
        }
        fatalError("Unexpected kind")
    }
    
    //MARK: - CollectionViewDelegate
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        guard let codigoFilme = viewModel.viewData.value?.resultados[indexPath.item].id else { return }
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let controller = storyboard.instantiateViewController(withIdentifier: "detalhesFilme") as? DetalhesFilmeViewController else {return}

            controller.codFilme = codigoFilme
            self.navigationController?.pushViewController(controller, animated: true)
        
    }
    
    @IBAction func buttonIrParaAnterior(_ sender: UIButton) {
        paginaAtual -= 1
        viewModel.loadTendencias(pagina: paginaAtual)
        colecaoFilmes.setContentOffset(CGPoint(x:0,y:0), animated: true)
        
        if paginaAtual == 1 {
            buttonAnterior?.isHidden = true
        }
        
    }
    
    
    @IBAction func buttonProximo(_ sender: UIButton) {
        
        paginaAtual += 1
        viewModel.loadTendencias(pagina: paginaAtual)
        colecaoFilmes.setContentOffset(CGPoint(x:0,y:0), animated: true)
        
        buttonAnterior?.isHidden = false
        
    }
    

}
