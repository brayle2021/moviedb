//
//  MovieDTO.swift
//  moviedb
//
//  Created by dearwolves on 06Monday/12/20211.
//

import Foundation

struct MovieDTO {
    
    private static let posterPathField = "poster_path"
    private static let adultField = "adult"
    private static let overviewField = "overview"
    private static let releaseDateField = "release_date"
    private static let genreIdsField = "genre_ids"
    private static let idField = "id"
    private static let originalTitleField = "original_title"
    private static let originaLanguangeField = "original_language"
    private static let titleField = "title"
    private static let backDropPathField = "backdrop_path"
    private static let popularityField = "popularity"
    private static let voteCountField = "vote_count"
    private static let videoField = "video"
    private static let voteAverageField =  "vote_average"
    
    
    
    var posterPath: String?
    var adult: Bool?
    var overview: String?
    var releaseDate: String?
    var genreIds: [Int]?
    var id: String?
    var originalTitle: String?
    var originaLanguange: String?
    var title: String?
    var backDropPath: String?
    var popularity: Double?
    var voteCount: Int?
    var video: Bool?
    var voteAverage: Int?
    
    init(movieData: Any) {
        if let item = movieData as? [String: Any] {
            posterPath = item[MovieDTO.posterPathField] as? String
            adult = item[MovieDTO.adultField] as? Bool
            overview = item[MovieDTO.overviewField] as? String
            releaseDate = item[MovieDTO.releaseDateField] as? String
            genreIds = item[MovieDTO.genreIdsField] as? [Int]
            id = item[MovieDTO.idField] as? String
            originalTitle = item[MovieDTO.originalTitleField] as? String
            originaLanguange = item[MovieDTO.originaLanguangeField] as? String
            title = item[MovieDTO.titleField] as? String
            backDropPath = item[MovieDTO.backDropPathField] as? String
            popularity = item[MovieDTO.popularityField] as? Double
            voteCount = item[MovieDTO.voteCountField] as? Int
            video = item[MovieDTO.videoField] as? Bool
            voteAverage = item[MovieDTO.posterPathField] as? Int
            
            
        }
    }
}
