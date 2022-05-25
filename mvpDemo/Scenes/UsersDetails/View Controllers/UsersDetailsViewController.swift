//
//  UsersDetailsViewController.swift
//  mvpDemo
//
//  Created by Islam NourEldin on 25/10/1443 AH.
//

import UIKit

class UsersDetailsViewController: UIViewController,UserDetailsView{
    var presenter: UserDetailsVCPresenter?
    

    @IBOutlet weak var nameTextField: UITextField!
    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var addressTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.viewDidLoad()
    }

    
    func displayName(name: String) {
        nameTextField.text = name
    }
    
    func displayEmail(email: String) {
        emailTextField.text = email
    }
    
    func displayAddress(address: String) {
        addressTextField.text = address
    }
    
    func displayImage(image: UIImage) {
        userImage.image = UIImage(systemName: "person")
    }
    
}
