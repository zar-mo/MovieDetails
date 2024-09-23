//
//  UserCellViewModel.swift
//  MovieDetails
//
//  Created by Abouzar Moradian on 9/23/24.
//

import Foundation

protocol UserCellViewModel{
    
    var user: User {get}
}

class UserCellViewModelImpl: UserCellViewModel{
    var user: User
    
    init(user: User) {
        self.user = user
    }
 
}
