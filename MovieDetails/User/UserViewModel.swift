//
//  UserViewModel.swift
//  MovieDetails
//
//  Created by Abouzar Moradian on 9/23/24.
//

import Foundation

protocol UserViewModel{
    
    var cellCount: Int {get}
    var apiClient: NetworkClient {get}
    var error: Error? {get}
    var onUpdate: ((UserViewModel) -> Void)? {set get}
    func userCellViewModel(at indexPath: IndexPath) -> UserCellViewModel
}

class UserViewModelImpl: UserViewModel {
    
    
    var cellCount: Int {
        users.count
    }
    
    var onUpdate: ((any UserViewModel) -> Void)?  {
        didSet { onUpdate?(self)}
    }
 
    var error: (any Error)? {
        didSet { onUpdate?(self)}
    }
 
    private var users: [User] = [] {
        didSet{ onUpdate?(self) }
    }
    var apiClient: any NetworkClient
    
    init(apiClient: NetworkClient){
        self.apiClient = apiClient
        
        Task{
            try await fetchData()
        }
    }
    
    func userCellViewModel(at indexPath: IndexPath) -> any UserCellViewModel {
        UserCellViewModelImpl(user: users[indexPath.row])
    }
    
    func fetchData() async throws{
        
        do{
            let request = GetUsersRequest()
            users = try await apiClient.fetchData(request)
            print(users)
        }catch{
            self.error = error
        }
    }
    
    
    
}
