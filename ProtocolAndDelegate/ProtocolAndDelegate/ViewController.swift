//
//  ViewController.swift
//  ProtocolAndDelegate
//
//  Created by jay on 2/23/22.
//

import UIKit

class ViewController: UIViewController, SendNameDelegate {

    @IBOutlet weak var welcome: UILabel!
    @IBOutlet weak var lblLastName: UILabel!
    @IBOutlet weak var lblFirstName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func getName(_ sender: Any) {
        performSegue(withIdentifier: "segueGetName", sender: self)
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "segueGetName" {
            let getNameVC = segue.destination as! SecondViewController
            guard let firstName = lblFirstName.text else {return}
            guard let lastName = lblLastName.text else {return}
            
            getNameVC.firstName = firstName
            getNameVC.lastName = lastName
            
            getNameVC.sendNameDelegate = self
            
        }
    }
    
    func setName(firstName: String, lastName: String) {
        lblFirstName.text = firstName
        lblLastName.text = lastName
    }
    
    func setWelcomeText(welcomeText: String) {
        welcome.text = welcomeText
    }
}

