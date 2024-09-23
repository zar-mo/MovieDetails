//
//  AlbumViewController.swift
//  MovieDetails
//
//  Created by Abouzar Moradian on 9/23/24.
//

import UIKit

class AlbumViewController: UIViewController {

    var viewModel: AlbumViewModel?
    
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        viewModel?.onUpdate = { viewModel in
            
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        

    }
    

}

extension  AlbumViewController:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.cellCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "AlbumCell", for: indexPath) as? AlbumTableViewCell else { return UITableViewCell()}
        
        cell.viewModel = viewModel?.albumCellViewModel(at: indexPath)
        return cell
        
    }
    
}
