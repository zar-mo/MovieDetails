//
//  AlbumCellViewModel.swift
//  MovieDetails
//
//  Created by Abouzar Moradian on 9/23/24.
//

import Foundation

protocol AlbumCellViewModel{
    
    var album: Album {get}
}

class AlbumCellViewModelImpl: AlbumCellViewModel {
    
    var album: Album
    
    init(album: Album) {
        self.album = album
    }
}
