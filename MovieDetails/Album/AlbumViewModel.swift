//
//  AlbumViewModel.swift
//  MovieDetails
//
//  Created by Abouzar Moradian on 9/23/24.
//

import Foundation

protocol AlbumViewModel{
   
    var cellCount: Int {get}
    var apiClient: NetworkClient {get}
    var error: Error? {get}
    var onUpdate: ((AlbumViewModel) -> Void)? {set get}
    func albumCellViewModel(at indexPath: IndexPath) -> AlbumCellViewModel
}

class AlbumViewModelImpl: AlbumViewModel{
    var cellCount: Int{
        albums.count
    }
    
    var onUpdate: ((any AlbumViewModel) -> Void)?  {
        didSet { onUpdate?(self)}
    }
 
    var error: (any Error)? {
        didSet { onUpdate?(self)}
    }
 
    private var albums: [Album] = [] {
        didSet{ onUpdate?(self) }
    }
    var apiClient: any NetworkClient
    
    init(apiClient: NetworkClient){
        
        self.apiClient = apiClient
        
        Task{
            try await fetchData()
        }
    }
    
    func albumCellViewModel(at indexPath: IndexPath) -> any AlbumCellViewModel {
        AlbumCellViewModelImpl(album: albums[indexPath.row])
    }
    
    func fetchData() async throws{
        

        do{
            let request = GetAlbumsRequest()
            albums = try await apiClient.fetchData(request)
            
        }catch{
            self.error = error
            print("failed to retrieve data:  \(error)")

        }
    }
    
    
}
