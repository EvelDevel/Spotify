//
//  Playlist.swift
//  Spotify
//
//  Created by Евгений Никитин on 07.03.2021.
//

import Foundation

struct Playlist: Codable {
    let description: String
    let external_urls: [String: String]
    let id: String
    let images: [APIImage]
    let name: String
    let owner: User
}
