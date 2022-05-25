//
//  UserDetailsRouter.swift
//  mvpDemo
//
//  Created by Islam NourEldin on 25/10/1443 AH.
//

import UIKit

class UserDetailsRouter{
    
    class func createUserDetailsViewController(user:User)->UIViewController{
        
        let userDetailsView = mainStoryBoard.instantiateViewController(withIdentifier: "UserDetailsViewController")
        
        if let  UserDetailsViewController = userDetailsView as? UserDetailsView{
            
            let presenter = UserDetailsVCPresenter(view: UserDetailsViewController,user: user)
            UserDetailsViewController.presenter = presenter
        }
        
        return userDetailsView
    }
    
    class var mainStoryBoard:UIStoryboard{
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
}
