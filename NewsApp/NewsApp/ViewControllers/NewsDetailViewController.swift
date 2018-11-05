//
//  NewsDetailViewController.swift
//  NewsApp
//
//  Created by b2c on 11/5/18.
//  Copyright © 2018 b2c. All rights reserved.
//

import UIKit
import WebKit

class NewsDetailViewController: BaseViewController {

    @IBOutlet weak var webView: WKWebView!

    var feed:NewsFeed
    @IBOutlet weak var contentLabel:UILabel!

    init(feed:NewsFeed)
    {
        self.feed = feed
        super.init(nibName: "NewsDetailViewController", bundle: nil)
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        if let url = URL(string: feed.url)
        {
        webView.load(URLRequest(url: url))
        webView.navigationDelegate = self

        }
        // Do any additional setup after loading the view.
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
extension NewsDetailViewController:WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error){
        self.stopActivityIndicator()
        
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
        self.stopActivityIndicator()
        
    }
}
