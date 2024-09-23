//
//  HomeViewModel.swift
//  MovieDetails
//
//  Created by Abouzar Moradian on 9/23/24.
//

import Foundation

protocol HomeViewModel{
    
    func userViewModel() -> UserViewModel
    func albumViewModel() -> AlbumViewModel
    
}

class HomeViewModelImpl: HomeViewModel {
    
    
    func userViewModel() -> any UserViewModel {
        let url = URL(string: Constants.jsonplaceholderBaseURL.rawValue)
        return UserViewModelImpl(apiClient: APIClient(baseUrl: url))
    }
    
    func albumViewModel() -> any AlbumViewModel {
        let url = URL(string: Constants.jsonplaceholderBaseURL.rawValue)
        return AlbumViewModelImpl(apiClient: APIClient(baseUrl: url))
    }
    
    
}
