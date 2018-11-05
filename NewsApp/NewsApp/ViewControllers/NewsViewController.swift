//
//  NewsViewController.swift
//  NewsApp
//
//  Created by b2c on 11/4/18.
//  Copyright © 2018 b2c. All rights reserved.
//

import UIKit

class NewsViewController: BaseViewController {
    
    @IBOutlet weak var tableView:UITableView!
    var newsFeeds = [NewsFeed] ()
    override func viewDidLoad() {
        super.viewDidLoad()
        configureCell()
        fetchNews()
        // Do any additional setup after loading the view.
    }

    func configureCell()
    {
    tableView.register(UINib.init(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
        tableView.rowHeight = UITableView.automaticDimension

    }
    private func fetchNews()
    {
        NewsHelper.fetchAllNews(failure: failureBlock()) {[weak self] (message, newsFeedItems) in
            guard let weakSelf = self else
            {
              return
            }
            weakSelf.newsFeeds = newsFeedItems
            weakSelf.tableView.reloadData()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
extension NewsViewController: UITableViewDataSource, UITableViewDelegate {
 
 // MARK: - UITableViewDataSource Methods
 
 func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
 return newsFeeds.count
 }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension

    }
 
 func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
 let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell") as! NewsCell
 cell.feed = newsFeeds[indexPath.row]
 return cell
 }
 
 // MARK: - UITableViewDelegate Methods
 
 func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 

 }
 }
