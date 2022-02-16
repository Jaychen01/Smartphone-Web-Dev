//
//  ViewController.swift
//  TableViewXibFile
//
//  Created by jay on 2/15/22.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tblView: UITableView!
    let foods = ["pho", "noodle", "burger", "cake", "pancake", "fries", "apple pie", "bread", "salad", "taco"]
    let foodNames = ["pho", "noodle", "burger", "cake", "pancake", "fries", "apple pie", "bread", "salad", "taco"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = Bundle.main.loadNibNamed("TableViewCell", owner: self, options: nil)?.first as! TableViewCell
        cell.imgView.image = UIImage(named: foods[indexPath.row])
        cell.lblImage.text = foodNames[indexPath.row]
        return cell
    }
}

