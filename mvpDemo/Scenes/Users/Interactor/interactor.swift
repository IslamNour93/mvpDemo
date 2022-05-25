//
//  interactor.swift
//  mvpDemo
//
//  Created by Islam NourEldin on 23/10/1443 AH.
//

import Foundation
import Alamofire

class UsersInteractor{
    
    func getUsers(completion :@escaping ([User]?,Error?)->()){
        
        guard let url = Url.shared.getUsersUrl() else {return}
        
        AF.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).response{
            response in
            switch response.result{
            case .failure(let error):
                completion(nil, error)
            case .success(_):
                guard let data = response.data else {return}
                
                do{
                    let json = try JSONDecoder().decode([User].self,from: data)
                    completion(json, nil)
                    print("Data has been Fetched Successfully")
                }catch let error{
                print(error)
                }
            }
        }
    }
}
