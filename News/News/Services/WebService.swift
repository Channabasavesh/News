//
//  WebService.swift
//  News
//
//  Created by Channabasavesh Chandrappa Budihal on 11/15/19.
//  Copyright © 2019 Channabasavesh Chandrappa Budihal. All rights reserved.
//

import Foundation

class WebService {
    
    func getArticles(url: URL, completion: @escaping ([Article]?) -> ()) {
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            
            if let error = error {
                print(error.localizedDescription)
                completion(nil)
            } else if let data = data {
                let articleList = try? JSONDecoder().decode(ArticleList.self, from: data)
                if let articleList = articleList {
                    completion(articleList.articles)
                }
                print(articleList?.articles)
            }
        }.resume()
    }
}
