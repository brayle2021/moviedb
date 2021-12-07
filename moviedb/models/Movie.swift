//
//  Movie.swift
//  moviedb
//
//  Created by dearwolves on 06Monday/12/20211.
//

import Foundation


struct Movie {
    let posterPath: String?
    let adult: Bool?
    let overview: String?
    let releaseDate: String?
    let genreIds: [Int]?
    let id: String?
    let originalTitle: String?
    let originaLanguange: String?
    let title: String?
    let backDropPath: String?
    let popularity: Double?
    let voteCount: Int?
    let video: Bool?
    let voteAverage: Int?
    
    init(dto: MovieDTO) {
        self.posterPath = dto.posterPath
        self.adult = dto.adult
        self.overview = dto.overview
        self.releaseDate = dto.releaseDate
        self.genreIds = dto.genreIds
        self.id = dto.id
        self.originalTitle = dto.originalTitle
        self.originaLanguange = dto.originaLanguange
        self.title = dto.title
        self.backDropPath = dto.backDropPath
        self.popularity = dto.popularity
        self.voteCount = dto.voteCount
        self.video = dto.video
        self.voteAverage = dto.voteAverage
        
    }
}


