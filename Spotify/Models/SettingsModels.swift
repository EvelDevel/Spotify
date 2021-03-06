//
//  SettingsModels.swift
//  Spotify
//
//  Created by Евгений Никитин on 04.04.2021.
//

import Foundation

struct Section {
    let title: String
    let options: [Option]
}

struct Option {
    let title: String
    let handler: () -> Void
}
