//
//  Artist.swift
//  Spotify
//
//  Created by Евгений Никитин on 07.03.2021.
//

import Foundation

struct Artist: Codable {
    let id: String
    let name: String
    let type: String
    let external_urls: [String: String]
}
