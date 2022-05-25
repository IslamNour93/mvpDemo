//
//  UsersCell.swift
//  mvpDemo
//
//  Created by Islam NourEldin on 23/10/1443 AH.
//

import UIKit

class UsersCell: UITableViewCell,UsersCellView {

    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var emailLabel: UILabel!
    @IBOutlet weak var addressLabel: UILabel!
    
    static let identifier = "UsersCell"
    
   static func nib()->UINib{
        return UINib(nibName: identifier, bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    func displayName(name: String) {
        nameLabel.text = name
    }
    
    func displayEmail(email: String) {
        emailLabel.text = email
    }
    
    func displayAddress(address: String) {
        addressLabel.text = address
    }
    
}
