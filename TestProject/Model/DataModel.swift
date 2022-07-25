//
//  DataModel.swift
//  TestProject
//
//  Created by Appnap WS01 on 25/7/22.
//

import Foundation

struct MovieDataList: Codable {
    var page: Int
    var results: [MovieData]
    enum CodingKeys: String, CodingKey {
        case page
        case results
    }
    
    init() {
        self.page = 0
        self.results = [MovieData]()
    }
    
    init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.page = try container.decodeIfPresent(Int.self, forKey: .page) ?? 0
            self.results = try container.decodeIfPresent([MovieData].self, forKey: .results) ?? [MovieData]()
        }
    }
}


struct MovieData: Codable {

    var id: Int
    var title: String?
    var overview: String?
    var backdropPath: String?
    var posterPath: String?

    enum CodingKeys: String, CodingKey {
        case id
        case title
        case overview
        case posterPath = "poster_path"
        case backdropPath = "backdrop_path"
    }
    
    init() {
        self.id = 0
        self.title = ""
        self.overview = ""
        self.backdropPath = ""
        self.posterPath = ""
    }
    
    init(from decoder: Decoder) throws {
        do {
            let container = try decoder.container(keyedBy: CodingKeys.self)
            self.id = try container.decodeIfPresent(Int.self, forKey: .id) ?? 0
            self.title = try container.decodeIfPresent(String.self, forKey: .title) ?? ""
            self.overview = try container.decodeIfPresent(String.self, forKey: .overview) ?? ""
            self.backdropPath = try container.decodeIfPresent(String.self, forKey: .backdropPath) ?? ""
            self.posterPath = try container.decodeIfPresent(String.self, forKey: .posterPath) ?? ""
        }
    }
}
