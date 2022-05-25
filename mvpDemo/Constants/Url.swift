//
//  Url.swift
//  mvpDemo
//
//  Created by Islam NourEldin on 23/10/1443 AH.
//

import Foundation

class Url{
    
    static let shared = Url()
    private init(){
        
    }
    
    func getUsersUrl()->URL?{
        return URL(string: "https://jsonplaceholder.typicode.com/users")
    }
}
