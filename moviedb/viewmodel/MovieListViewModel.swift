//
//  MovieListViewModel.swift
//  moviedb
//
//  Created by dearwolves on 06Monday/12/20211.
//

import Foundation
import RxSwift


class MovieListViewModel {
    var disposeBag: DisposeBag
    var movies: [Movie] = []
    let movieItems = PublishSubject<[Movie]>()
    
    let movieServiceManager = MovieDBServices()
    
    init(disposeBag: DisposeBag) {
        self.disposeBag = disposeBag
    }
    
    func getPopularMovies() -> Observable<[Movie]> {
        return movieServiceManager.fetchMovies()
    }
}
