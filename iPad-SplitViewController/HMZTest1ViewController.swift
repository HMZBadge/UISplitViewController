//
//  HMZTest1ViewController.swift
//  iPad-SplitViewController
//
//  Created by 赵志丹 on 15/12/29.
//  Copyright © 2015年 HMZBadge. All rights reserved.
//

import UIKit

class HMZTest1ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "next", style: .Plain, target: self, action: "next")
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "back", style: .Plain, target: self, action: "back")

    }
    
    @objc private func next() {
        navigationController?.pushViewController(HMZTest2ViewController(), animated: true)
    }
    @objc private func back() {
        dismissViewControllerAnimated(true, completion: nil)
    }
}
