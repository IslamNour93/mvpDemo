//
//  UsersRouter.swift
//  mvpDemo
//
//  Created by Islam NourEldin on 25/10/1443 AH.
//

import UIKit

class UsersRouter{
    
    class func createUsersViewController()->UIViewController{
        
        let navigationController = mainStoryBoard.instantiateViewController(withIdentifier: "NavigationController")
        let usersView = navigationController.children.first as? UsersView
        let interactor = UsersInteractor()
        let router = UsersRouter()
        let presenter = UsersViewControllerPresenter(view: usersView,interactor: interactor,router: router)
        usersView?.presenter = presenter
        
        return navigationController
    }
    
    class var mainStoryBoard: UIStoryboard{
        return UIStoryboard(name: "Main", bundle: Bundle.main)
    }
    
    func navigateToUserDetails(from view:UsersView?,user:User){
        let userDetailsView = UserDetailsRouter.createUserDetailsViewController(user: user)
        if let viewController = view as? UIViewController{
            viewController.navigationController?.pushViewController(userDetailsView, animated: true)
        }
    }
}
