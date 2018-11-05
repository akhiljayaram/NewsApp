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
    let progressView = UIProgressView(progressViewStyle: .default)
    private var estimatedProgressObserver: NSKeyValueObservation?

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
//        startActivityIndicator()
            setupProgressView()
            setupEstimatedProgressObserver()

        webView.load(URLRequest(url: url))
        webView.navigationDelegate = self
            webView.uiDelegate = self

        }
        // Do any additional setup after loading the view.
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        if progressView.superview != nil
        {
            progressView.removeFromSuperview()

        }

    }
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        if progressView.superview == nil
        {
            setupProgressView()
        }
    }
    private func setupProgressView() {
        guard let navigationBar = navigationController?.navigationBar else { return }
        
        progressView.translatesAutoresizingMaskIntoConstraints = false
        navigationBar.addSubview(progressView)
        progressView.progressTintColor = UIColor.init(netHex: 0x2F2F2F)
        progressView.isHidden = true
        
        NSLayoutConstraint.activate([
            progressView.leadingAnchor.constraint(equalTo: navigationBar.leadingAnchor),
            progressView.trailingAnchor.constraint(equalTo: navigationBar.trailingAnchor),
            
            progressView.bottomAnchor.constraint(equalTo: navigationBar.bottomAnchor),
            progressView.heightAnchor.constraint(equalToConstant: 2.0)
            ])
    }
    private func setupEstimatedProgressObserver() {
        estimatedProgressObserver = webView.observe(\.estimatedProgress, options: [.new]) { [weak self] webView, _ in
            self?.progressView.progress = Float(webView.estimatedProgress)
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
extension NewsDetailViewController:WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error){
        stopActivityIndicator()
        
        
    }
    func webView(_: WKWebView, didStartProvisionalNavigation _: WKNavigation!) {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
        
        UIView.transition(with: progressView,
                          duration: 0.33,
                          options: [.transitionCrossDissolve],
                          animations: {
                            self.progressView.isHidden = false
        },
                          completion: nil)
    }

    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!){
       stopActivityIndicator()
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
        
        UIView.transition(with: progressView,
                          duration: 0.33,
                          options: [.transitionCrossDissolve],
                          animations: {
                            self.progressView.isHidden = true
        },
                          completion: nil)

        
    }
}
extension NewsDetailViewController:WKUIDelegate {

}
