//
//  UserViewController.swift
//  MovieDetails
//
//  Created by Abouzar Moradian on 9/23/24.
//

import UIKit

class UserViewController: UIViewController {

    var viewModel: UserViewModel?

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

extension  UserViewController:  UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.cellCount ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "UserCell", for: indexPath) as? UserTableViewCell else { return UITableViewCell()}
        
        cell.viewModel = viewModel?.userCellViewModel(at: indexPath)
        return cell
        
    }
    
}
