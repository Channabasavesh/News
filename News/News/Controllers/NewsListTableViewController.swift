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
    
    private var articleListViewModel: ArticleListViewModel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }
    
    private func setup() {
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
        let url = URL(string: "https://newsapi.org/v2/top-headlines?country=us&apiKey=44834171c477464daac5ab835cea6779")!
        
        WebService().getArticles(url: url) { (articles) in
            
            if let articles = articles {
                self.articleListViewModel = ArticleListViewModel(articles: articles)
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return self.articleListViewModel == nil ? 0 : self.articleListViewModel.numberOfSections
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleListViewModel.numberOfRowsInSection(section)
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let articleCell = tableView.dequeueReusableCell(withIdentifier: "ArticleTableViewCell") as? ArticleTableViewCell else { fatalError("ArticleTableViewCell not found") }
        let articleViewModel = self.articleListViewModel.articleAtIndex(indexPath.row)
        articleCell.titleLabel.text = articleViewModel.title
        articleCell.descriptionLabel.text = articleViewModel.description
        return articleCell
    }
}
