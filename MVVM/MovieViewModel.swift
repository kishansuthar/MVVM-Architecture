//
//  MovieViewModel.swift
//  MVVM
//
//  Created by Kishan Suthar on 07/06/20.
//  Copyright © 2020 Kishan Suthar. All rights reserved.
//

import Foundation

protocol ViewModelDelegate : class {
    func reloadTable()
}

class MoviesViewModel {
    
    var dataItems : [PopularMovieResult] = []
    weak var delegate: ViewModelDelegate?
    
    init() {
        
    }
    
    func getPopularMovieList() {
        
        APIManager.makeAPIRequest(isFormDataRequest: true, isContainXAPIToken: false, isContainContentType: false, path: "https://api.themoviedb.org/3/movie/popular?api_key=b42de0d7051793f886f6c0569505a420&language=en-US&page=1", params: [:]) {[weak self] (response) in
            
            guard let strongSelf = self else { return }
            
            switch response {
            case .success(var result):
                DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                    strongSelf.dataItems.append(contentsOf: result)
                    strongSelf.delegate?.reloadTable()
                }
            case.failure:
                break
            }
        }
    }
}
