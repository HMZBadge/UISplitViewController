//
//  HMZPopoverController.swift
//  iPad-SplitViewController
//
//  Created by 赵志丹 on 15/12/29.
//  Copyright © 2015年 HMZBadge. All rights reserved.
//

import UIKit

class HMZPopoverController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    
    @IBAction func test1Click(sender: UIButton) {
        let vc = HMZTest1ViewController()
        let nav = UINavigationController(rootViewController: vc)
        vc.view.backgroundColor = UIColor.blueColor()
        vc.modalPresentationStyle = .OverCurrentContext
        vc.popoverPresentationController?.sourceView = self.view
        vc.popoverPresentationController?.sourceRect = sender.frame
        vc.preferredContentSize = CGSizeMake(250, 300)
        vc.popoverPresentationController?.permittedArrowDirections = .Up
        self.presentViewController(nav, animated: true, completion: nil)
    }
    
    @IBAction func test2Click(sender: UIButton) {
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor.redColor()
        vc.modalPresentationStyle = .Popover
        vc.popoverPresentationController?.sourceView = self.view
        vc.popoverPresentationController?.sourceRect = sender.frame
        vc.preferredContentSize = CGSizeMake(250, 300)
        vc.popoverPresentationController?.permittedArrowDirections = .Up
        self.presentViewController(vc, animated: true, completion: nil)
    }
    
    @IBAction func test3Click(sender: UIButton) {
        let vc = HMZColorViewController { (color) -> () in
            self.view.backgroundColor = color
        }
        
        vc.modalPresentationStyle = .Popover
        vc.popoverPresentationController?.sourceView = self.view
        vc.popoverPresentationController?.sourceRect = sender.frame
        vc.popoverPresentationController?.permittedArrowDirections = .Any
        vc.preferredContentSize = CGSizeMake(225, 250)
        self.presentViewController(vc, animated: true, completion: nil)
        
        //let popVc = UIPopoverController(contentViewController: vc)
        //popVc.popoverContentSize = CGSizeMake(225, 250)
        //popVc.presentPopoverFromRect(sender.bounds, inView: sender, permittedArrowDirections: .Any, animated: true)
    }
    
    
    @IBAction func test4Click(sender: UIBarButtonItem) {
        let vc = HMZTest4TableViewController()
        let popVc = UIPopoverController(contentViewController: vc)
        let count = vc.tableView(vc.tableView, numberOfRowsInSection: 0)
        popVc.popoverContentSize = CGSize(width: 200, height: count * 44)
        popVc.presentPopoverFromBarButtonItem(sender, permittedArrowDirections: .Any, animated: true)
    }
}
