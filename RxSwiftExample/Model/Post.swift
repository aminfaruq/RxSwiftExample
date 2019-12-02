//
//  Post.swift
//  RxSwiftExample
//
//  Created by Amin faruq on 02/12/19.
//  Copyright © 2019 Amin faruq. All rights reserved.
//

import Foundation

struct Post : Decodable {
    let id : Int
    let title : String
    let body : String
}
