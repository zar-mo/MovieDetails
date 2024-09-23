//
//  ViewController.swift
//  MovieDetails
//
//  Created by Abouzar Moradian on 9/20/24.
//

import UIKit

class HomeViewController: UIViewController {

    var viewModel : HomeViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "ShowAlbums" {
            if let albumViewController = segue.destination as? AlbumViewController {
                albumViewController.viewModel = viewModel?.albumViewModel()
            }
        }else if segue.identifier == "ShowUsers" {
            if let userViewController = segue.destination as? UserViewController {
                userViewController.viewModel = viewModel?.userViewModel()
            }
        }
    }


}

