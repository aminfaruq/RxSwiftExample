//
//  ViewController.swift
//  RxSwiftExample
//
//  Created by Amin faruq on 02/12/19.
//  Copyright © 2019 Amin faruq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    /// - Variable from tableview
    @IBOutlet weak var tablePost: UITableView!
    
    /// - Reference viewmodel
    let postVM = PostVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        /// - Fetch data post
        postVM.getPosts()
        
        self.tablePost.register(UINib.init(nibName: "TableCell", bundle: self.nibBundle), forCellReuseIdentifier: "TableCell")

        
        /// - Bind post from viewmodel to tablepost
        postVM.posts.bind(to: tablePost.rx.items(cellIdentifier : "TableCell", cellType: TableCell.self)){row , post, cell in
            
            /// - Set data table to lable from title
            cell.lbText.text = post.title
        }
    }


}

