//
//  PostVM.swift
//  RxSwiftExample
//
//  Created by Amin faruq on 02/12/19.
//  Copyright © 2019 Amin faruq. All rights reserved.
//

import Foundation
import RxSwift
import RxCocoa

class PostVM {
    /// - create a variable observer to hold data from the post model
    /// - observer is used to monitor changes in the data set.
    var posts = BehaviorRelay<[Post]>(value: [])
    
    /// - a function for request data from api
    func getPosts(){
        guard let url = URL(string: "https://jsonplaceholder.typicode.com/posts") else {
            return
        }
        /// - fetch data using URLSession
        URLSession.shared.dataTask(with: url){(data, response , error) in
            do {
                self.posts.accept(try JSONDecoder().decode([Post].self, from: data!))
            }catch let err{
                print(err)
            }
        }.resume()
        
    }
}
