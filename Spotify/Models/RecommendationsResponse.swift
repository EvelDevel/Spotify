//
//  RecommendationsResponse.swift
//  Spotify
//
//  Created by Евгений Никитин on 17.04.2021.
//

import Foundation

struct RecommendationsResponse: Codable {
    let tracks: [AudioTrack]
}
