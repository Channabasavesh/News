//
//  Article.swift
//  News
//
//  Created by Channabasavesh Chandrappa Budihal on 11/15/19.
//  Copyright © 2019 Channabasavesh Chandrappa Budihal. All rights reserved.
//

import Foundation

struct ArticleList: Decodable {
    let articles: [Article]
}

struct Article: Decodable {
    let title: String
    let description: String
}
