//
//  NewsListTableViewController.swift
//  News
//
//  Created by Channabasavesh Chandrappa Budihal on 11/13/19.
//  Copyright © 2019 Channabasavesh Chandrappa Budihal. All rights reserved.
//

import Foundation
import UIKit

class NewsListTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
}
