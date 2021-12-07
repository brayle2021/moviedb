//
//  MovieListViewController.swift
//  moviedb
//
//  Created by dearwolves on 06Monday/12/20211.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa


class MovieListViewController: BaseViewController {
    
    @IBOutlet weak var moviesTable: UITableView!
    
    private lazy var movieListViewModel = MovieListViewModel(disposeBag: disposeBag)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupViews()
        setUpBindings()
        loadData()
        
    }
    
    
    private func setupViews() {

        
        moviesTable.register(UINib(nibName: MovieListTableViewCell.identifier, bundle: nil), forCellReuseIdentifier: MovieListTableViewCell.identifier)
    }
    private func setUpBindings() {
        
        movieListViewModel.movieItems
            .bind(to: moviesTable.rx.items(cellIdentifier: MovieListTableViewCell.identifier,cellType: MovieListTableViewCell.self)) { (row, movie, cell) in
                cell.cellMovie = movie
                cell.selectionStyle = .none
                
                
                
            }.disposed(by: self.disposeBag)
        
        moviesTable.rx.itemSelected
            .subscribe(onNext: { indexpath in
                self.showMovieOverView(movie: self.movieListViewModel.movies[indexpath.row])
            }).disposed(by: disposeBag)
        
            
    }
    
    private func loadData() {
        movieListViewModel.getPopularMovies()
            .subscribe(onNext: { ms in
                print("movie count \(ms.count)")
            
                self.movieListViewModel.movieItems.onNext(ms)
                self.movieListViewModel.movies = ms
            }, onError: { (error) in

            }, onCompleted: {
                self.moviesTable.reloadData()

            }, onDisposed: nil)
            .disposed(by: disposeBag)
    }
    
    private func showMovieOverView(movie: Movie) {
        let storyBoard = UIStoryboard(name: "Main", bundle: nil)
        let v = storyBoard.instantiateViewController(withIdentifier: MovieViewController.storyBoardID) as! MovieViewController
        v.movie = movie
        self.present(v, animated: true, completion: nil)
    }
    
    
}
