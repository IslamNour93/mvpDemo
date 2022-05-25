//
//  UserDetailsVCPresenter.swift
//  mvpDemo
//
//  Created by Islam NourEldin on 25/10/1443 AH.
//

import Foundation
import UIKit

protocol UserDetailsView: AnyObject{
    
    var presenter:UserDetailsVCPresenter?{get set}
    func displayName(name:String)
    func displayEmail(email:String)
    func displayAddress(address:String)
    func displayImage(image:UIImage)
}

class UserDetailsVCPresenter{
    private weak var view:UserDetailsView?
    var user:User?
    
    
    init(view:UserDetailsView,user:User){
        self.view = view
        self.user = user
    }
    
    func viewDidLoad(){
        passUserDate()
    }
    
    private func passUserDate(){
        view?.displayName(name: user?.name ?? "")
        view?.displayEmail(email: user?.email ?? "")
        view?.displayAddress(address: "\(user?.address?.street ?? ""), \(user?.address?.suite ?? "")")
        view?.displayImage(image: UIImage(systemName: "person")!)
    }
    
}
