//
//  UsersViewControllerPresenter.swift
//  mvpDemo
//
//  Created by Islam NourEldin on 23/10/1443 AH.
//

import Foundation

protocol UsersView:AnyObject{
    
    var presenter:UsersViewControllerPresenter? {get set}
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError(error:String)
}

protocol UsersCellView{
    
    func displayName(name:String)
    func displayEmail(email:String)
    func displayAddress(address:String)
}

class UsersViewControllerPresenter{
    private weak var view:UsersView?
    private let interactor:UsersInteractor
    private let router: UsersRouter
    private var users = [User]()
    
    init(view:UsersView?, interactor:UsersInteractor,router:UsersRouter){
        self.view = view
        self.interactor = interactor
        self.router = router
    }
    
    func viewDidLoad(){
        getUsers()
    }
    
    func getUsers(){
        view?.showIndicator()
        interactor.getUsers { [weak self] users, error in
            guard let self = self else{return}
            self.view?.hideIndicator()
            if let error = error {
                self.view?.showError(error: error.localizedDescription)
            }else{
                guard let users = users else {return}
                self.users = users
                self.view?.fetchingDataSuccess()
            }
        }
    }
    
    func getUsersCount()->Int{
        return users.count
    }
    
    func configureCell(cell:UsersCellView?, index:Int){
        let user = users[index]
        cell?.displayName(name: user.name ?? "")
        cell?.displayEmail(email: user.email ?? "")
        guard let address = user.address else{return}
        cell?.displayAddress(address: "\(address.street ?? ""),\(address.suite ?? "")")
    }
    
    func didSelectRow(index:Int){
        let user = users[index]
        router.navigateToUserDetails(from: view,user: user)
    }
}
