//
//  MovieDBServices.swift
//  moviedb
//
//  Created by dearwolves on 06Monday/12/20211.
//

import Foundation
import Alamofire
import RxSwift


class MovieDBServices {
    
    private static let authKey = "455bac36b9e926e667996eacd3778063"
    
    
    func fetchMovies() -> Observable<[Movie]> {
        
        let url = "https://api.themoviedb.org/3/movie/popular?api_key=" + MovieDBServices.authKey
        
        return Observable<[Movie]>.create({ (observer) -> Disposable in
            AF.request(url, method: .get)
                .validate()
                .responseData { response in
                    var movies: [Movie] = []
                    
                    switch response.result {
                    case .success:
                        print("success")
                        if let data = response.data {
                            
                            do {
                                let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any]
                                if let dataJson = json, let result = dataJson["results"] as? [[String: Any]]{
                                    movies = result.map{ Movie(dto: MovieDTO(movieData: $0)) }
                                    observer.onNext(movies)
                                    observer.onCompleted()
                                }
                                
                            } catch {
                                print(" serializattion error")
                                
                            }
                            
                          
                        }
                        
                        
                    case let .failure(error):
                        print("error")
                        observer.onError(error)
                    }
                }
            
            
        
            return Disposables.create()
        })
      
    }
    
    
}
