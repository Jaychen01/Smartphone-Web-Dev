//
//  SecondViewController.swift
//  ProtocolAndDelegate
//
//  Created by jay on 2/23/22.
//

import UIKit

protocol SendNameDelegate {
    func setName(firstName: String, lastName : String)
    func setWelcomeText(welcomeText: String)
}

class SecondViewController: UIViewController {
    
    var firstName : String?
    var lastName : String?
    
    var sendNameDelegate : SendNameDelegate?

    @IBOutlet weak var txtLastName: UITextField!
    @IBOutlet weak var txtFirstName: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        guard let firstName = firstName else {return}
        guard let lastName = lastName else {return}
        
        txtFirstName.text = firstName
        txtLastName.text = lastName

    }
    
    @IBAction func saveName(_ sender: Any) {
        
        guard let first = txtFirstName.text else {return}
        guard let last = txtLastName.text else {return}
        sendNameDelegate?.setName(firstName: first, lastName: last)
        sendNameDelegate?.setWelcomeText(welcomeText: "Welcome !  \(first) \(last)")
        self.navigationController?.popViewController(animated: true)
    }
    
}
