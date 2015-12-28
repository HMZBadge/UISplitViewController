//
//  HMZWebViewController.swift
//  iPad-SplitViewController
//
//  Created by 赵志丹 on 15/12/28.
//  Copyright © 2015年 HMZBadge. All rights reserved.
//

import UIKit

class HMZWebViewController: UIViewController {
    
    private let webView = UIWebView()
    var food: HMZFood? {
        didSet {
            let url = NSURL(fileURLWithPath: NSBundle.mainBundle().pathForResource(food?.idstr, ofType: "html", inDirectory: "Html/food")!)
            webView.loadRequest(NSURLRequest(URL: url))
            webView.sizeToFit()
            title = food?.name
        }
    }
    override func loadView() {
        self.view = webView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "返回", style: .Plain, target: self, action: "back")
        let swipe = UISwipeGestureRecognizer(target: self, action: "back")
        swipe.direction = .Right
        self.view.addGestureRecognizer(swipe)
    }
    
    @objc private func back() {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
    
}
