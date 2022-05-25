//
//  ViewController.swift
//  mvpDemo
//
//  Created by Islam NourEldin on 23/10/1443 AH.
//

import UIKit
import NVActivityIndicatorView

class UsersViewController: UIViewController {

   
    @IBOutlet weak var usersTableView: UITableView!
    var presenter: UsersViewControllerPresenter?
    let spinner = NVActivityIndicatorView(frame: .zero, type: .lineSpinFadeLoader, color: .blue, padding: 0)
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Users"
        setupTableView()
//        presenter = UsersViewControllerPresenter(view: self)
        presenter?.viewDidLoad()
        setupSpinner()
    }
    
    func setupTableView(){
        usersTableView.delegate = self
        usersTableView.dataSource = self
        usersTableView.register(UsersCell.nib(), forCellReuseIdentifier: UsersCell.identifier)
    }
    
    func setupSpinner(){
        view.addSubview(spinner)
        spinner.translatesAutoresizingMaskIntoConstraints=false
        NSLayoutConstraint.activate([
            spinner.widthAnchor.constraint(equalToConstant:40),
            spinner.heightAnchor.constraint(equalToConstant:40),
            spinner.centerYAnchor.constraint(equalTo:view.centerYAnchor),
            spinner.centerXAnchor.constraint(equalTo:view.centerXAnchor)
        ])
    }
}

//MARK: Users Protocol Delegate
extension UsersViewController :UsersView{
    func showIndicator() {
        spinner.startAnimating()
    }
    
    func hideIndicator() {
        spinner.stopAnimating()
    }
    
    func fetchingDataSuccess() {
        usersTableView.reloadData()
    }
    
    func showError(error: String) {
        print(error)
    }
}

//MARK: tableView dataSource and Delegate

extension UsersViewController : UITableViewDelegate,UITableViewDataSource{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return presenter?.getUsersCount() ?? 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: UsersCell.identifier,for: indexPath) as! UsersCell
        presenter?.configureCell(cell: cell, index: indexPath.row)
    
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        presenter?.didSelectRow(index: indexPath.row)
    }
}
