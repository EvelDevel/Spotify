//
//  AlbumViewController.swift
//  Spotify
//
//  Created by Евгений Никитин on 22.04.2021.
//

import UIKit

class AlbumViewController: UIViewController {

    private let album: Album
    
    init(album: Album) {
        self.album = album
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = album.name
        view.backgroundColor = .systemBackground
    }
}
