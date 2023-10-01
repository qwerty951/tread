//
//  ViewController.swift
//  cell1
//
//  Created by admin on 26.09.2023.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var dataManager = DataManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        dataManager.loadImagesFromJSON()
        tableView.reloadData()
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.arreysImages.count
        
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellImage", for: indexPath) as? ImageTableViewCell
        
        if let url = URL(string: dataManager.arreysImages[indexPath.row]){
            cell?.loadImage(url: url)
        }
        return cell!
    }
}

