//
//  NewsViewController.swift
//  NewsApp
//
//  Created by b2c on 11/4/18.
//  Copyright © 2018 b2c. All rights reserved.
//

import UIKit
import ESPullToRefresh

class NewsViewController: BaseViewController {
    
    @IBOutlet weak var tableView:UITableView!
    var newsFeeds = [NewsFeed] ()
    var fetchingNews = false
    
    var totalAvailableNewsCount = 0
    override func viewDidLoad() {
        title = "NEWS"
        super.viewDidLoad()
        configureCell()
        fetchNews()
        tableView.es.addPullToRefresh {
            [unowned self] in
            
            self.fetchNews(append: false)
            self.tableView.es.stopPullToRefresh(ignoreDate: true)
        }

        // Do any additional setup after loading the view.
    }

    func configureCell()
    {
    tableView.register(UINib.init(nibName: "NewsCell", bundle: nil), forCellReuseIdentifier: "NewsCell")
        tableView.rowHeight = UITableView.automaticDimension

    }
    private func fetchNews(append:Bool = true)
    {
        startActivityIndicator()
        fetchingNews = true
        if !append
        {
           newsFeeds.removeAll()
        }
        NewsHelper.fetchAllNews(page: nextPage, failure: failureBlock()) {[weak self] (message, newsFeedItems, totalAvailableNewsCount) in
            
            guard let weakSelf = self else
            {
              return
            }
           
            weakSelf.totalAvailableNewsCount = totalAvailableNewsCount
            weakSelf.newsFeeds.append(contentsOf: newsFeedItems)
            weakSelf.tableView.reloadData()
            weakSelf.fetchingNews = false
            weakSelf.stopActivityIndicator()

        }
    }
    var shouldLoadMore:Bool
    {
        return totalAvailableNewsCount > newsFeeds.count
    }
    var nextPage:Int
    {
        return newsFeeds.count / NewsHelper.newsFeedPerPage
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
    cell.delegate = self
 return cell
 }
    
func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
    let lastElement = newsFeeds.count - 1
    if !fetchingNews && indexPath.row == lastElement && shouldLoadMore{
        fetchNews()
    }
}
   
 // MARK: - UITableViewDelegate Methods
 
 func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
 

    let vc = NewsDetailViewController.init(feed: newsFeeds[indexPath.row])
    navigationController?.pushViewController(vc, animated: true)
 }
 }

extension NewsViewController:NewsCellDelegate
{
    func didPressShare(cell: NewsCell, feed: NewsFeed?) {
        guard let urlString = feed?.url, let  url = URL.init(string:urlString) else
        {
            showErrorMessage(message: "Sorry! No url fo sharing")
            return
            
        }
        let activityViewController:UIActivityViewController = UIActivityViewController(activityItems: [url], applicationActivities: nil)

        activityViewController.excludedActivityTypes = [UIActivity.ActivityType.print]
        self.present(activityViewController, animated: true, completion: nil)

    }
    
    
}
