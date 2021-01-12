//
//  FilmeAPI.swift
//  StarMovies
//
//  Created by Pedro Spim Costa on 07/01/21.
//  Copyright © 2021 Pedro Spim Costa. All rights reserved.
//

import UIKit
import Alamofire


protocol FilmeAPIProtocol {
    func pegarDetalhesFilme(codFilme:Int, completion:@escaping(_ filme:FilmeModel) -> Void)
}

class FilmeAPI: FilmeAPIProtocol {
    
    // MARK: - GET
    
    func pegarListaTendenciasFilmes(pagina:Int, completion:@escaping(Array<Dictionary<String, Any>>) -> Void) {
        
        Alamofire.request("https://api.themoviedb.org/3/trending/movie/week?api_key=bbed29429b1ca9848cd2e58686edc4cc&language=pt-BR&page=\(pagina)", method: .get).responseJSON { (resposta) in
            switch resposta.result {
            case .success:
                
                if let respostaFinal = resposta.result.value as? Dictionary<String, Any> {
                    guard let listaDeFilmes = respostaFinal["results"] as? Array<Dictionary<String, Any>> else { return }
                    completion(listaDeFilmes)
                }
                
                break
            case .failure:
                print(resposta.error!)
                break
            }
        }
    }
    
    func pegarDetalhesFilme(codFilme:Int, completion:@escaping(_ filme:FilmeModel) -> Void){
        
        Alamofire.request("https://api.themoviedb.org/3/movie/\(codFilme)?api_key=bbed29429b1ca9848cd2e58686edc4cc&language=pt-BR", method: .get).responseJSON { (resposta) in
            switch resposta.result {
            case .success:
                
                guard let jsonData = try? JSONSerialization.data(withJSONObject: resposta.result.value!, options: []) else { return }
                
                do {
                let filmeCodable = try JSONDecoder().decode(FilmeModel.self, from: jsonData)
                completion(filmeCodable)
                }catch{
                    print(error)
                }
                
                break
            case .failure:
                print(resposta.error!)
                break
            }
        }
        
        
    }
    
    //MARK: - Funcoes
    
    func gerarURLImagem(link:String) -> URL?{
        
        if let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500\(link)"){
            return imageUrl
        }
        return nil
    }

}
