//
//  ViewController.swift
//  Foodimages
//
//  Created by jay on 2/7/22.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate,UITableViewDataSource {
    
    let foods = ["pho", "noodle", "burger", "cake", "pancake", "fries", "apple pie", "bread", "salad", "taco"]
    let foodNames = ["pho", "noodle", "burger", "cake", "pancake", "fries", "apple pie", "bread", "salad", "taco"]

    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.delegate = self
        tblView.dataSource = self
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as!TableViewCell
        cell.imgViewCell.image = UIImage(named: foods[indexPath.row])
        cell.lbCell.text = foodNames[indexPath.row]
        
        return cell
    }
}

