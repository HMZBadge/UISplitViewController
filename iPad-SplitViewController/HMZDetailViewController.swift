//
//  HMZDetailViewController.swift
//  iPad-SplitViewController
//
//  Created by 赵志丹 on 15/12/28.
//  Copyright © 2015年 HMZBadge. All rights reserved.
//

import UIKit

class HMZDetailViewController: UITableViewController {
    var foodType: HMZFoodType? {
        didSet {
            foods = HMZFood.foods(foodType?.idstr ?? "1")
            title = foodType?.name
            
            tableView.reloadData()
            if HMZCommon.share.isPad {
                tableView.scrollToRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), atScrollPosition: .Middle, animated: false)
            }
        }
    }
    var foods: [HMZFood]? = HMZFood.foods("1")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "家常菜"
        tableView.rowHeight = 100
        if !HMZCommon.share.isPad {
            navigationItem.rightBarButtonItem?.enabled = false
        }
    }
    
}

// MARK: - Table view data source
extension HMZDetailViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foods?.count ?? 0
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = HMZFoodViewCell.cellWithTableView(tableView)
        let v = UIView()
        v.backgroundColor = UIColor.blueColor()
        cell.selectedBackgroundView = v
        cell.food = foods?[indexPath.row]
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let webVc = HMZWebViewController()
        webVc.food = foods![indexPath.row]
        let nav = UINavigationController(rootViewController: webVc)
        nav.modalPresentationStyle = .FormSheet
        presentViewController(nav, animated: true, completion: nil)
    }
}

// MARK: - HMZMasterViewControllerDelegate
extension HMZDetailViewController: HMZMasterViewControllerDelegate {
    func masterViewController(vc: HMZMasterViewController, didSelectedFoodType foodType: HMZFoodType) {
        self.foodType = foodType
    }
}

// MARK: - UISplitViewControllerDelegate
extension HMZDetailViewController: UISplitViewControllerDelegate {
    func splitViewController(svc: UISplitViewController, willChangeToDisplayMode displayMode: UISplitViewControllerDisplayMode) {
        /**
        UISplitViewControllerDisplayModeAutomatic,
        UISplitViewControllerDisplayModePrimaryHidden, 主要的隐藏
        UISplitViewControllerDisplayModeAllVisible,    显示所有
        UISplitViewControllerDisplayModePrimaryOverlay,主要的覆盖
        */
        if displayMode == .PrimaryHidden {
            self.navigationItem.leftBarButtonItem = svc.displayModeButtonItem()
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationCurve(.EaseOut)
            let frame = view.frame
            view.frame = CGRect(x: frame.origin.x - 320, y: frame.origin.y, width: frame.size.width, height: frame.size.height)
            UIView.commitAnimations()
        } else if displayMode == .AllVisible {
            self.navigationItem.leftBarButtonItem = nil
        } else if displayMode == .PrimaryOverlay {
            /**
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationCurve:UIViewAnimationCurveEaseOut];
            if (_centerController.view.frame.origin.x == self.view.frame.origin.x || _centerController.view.frame.origin.x == 100) {
            [_centerController.view setFrame:CGRectMake(_centerController.view.frame.origin.x-100, _centerController.view.frame.origin.y, _centerController.view.frame.size.width, _centerController.view.frame.size.height)];
            }
            
            [UIView commitAnimations];
            */
            UIView.beginAnimations(nil, context: nil)
            UIView.setAnimationCurve(.EaseOut)
            let frame = view.frame
            view.frame = CGRect(x: frame.origin.x + 320, y: frame.origin.y, width: frame.size.width, height: frame.size.height)
            UIView.commitAnimations()
        }
    }
    
}
