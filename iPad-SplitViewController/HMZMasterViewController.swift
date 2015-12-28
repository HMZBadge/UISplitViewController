//
//  HMZMasterViewController.swift
//  iPad-SplitViewController
//
//  Created by 赵志丹 on 15/12/28.
//  Copyright © 2015年 赵志丹. All rights reserved.
//

import UIKit
@objc protocol HMZMasterViewControllerDelegate: NSObjectProtocol {
    optional func masterViewController(vc: HMZMasterViewController, didSelectedFoodType foodType: HMZFoodType)
}

class HMZMasterViewController: UITableViewController {
    private let cellId = "FoodTypeID"
    
    var selectedIndexPath = NSIndexPath(forRow: 0, inSection: 0)
    var foodTypeDelegate: HMZMasterViewControllerDelegate?
    var foodTypes:[HMZFoodType] = {
        var t = [HMZFoodType]()
        let path = NSBundle.mainBundle().pathForResource("food_types.plist", ofType: nil)!
        let array = NSArray(contentsOfFile: path)
        
        array?.enumerateObjectsUsingBlock({ (dict, _, _) -> Void in
            t.append(HMZFoodType(dict: dict as! [String : AnyObject]))
        })
        return t
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "菜系"
        tableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: cellId)
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        if HMZCommon.share.isPad {
            tableView.selectRowAtIndexPath(selectedIndexPath, animated: true, scrollPosition: .None)
        }
    }
}

// MARK: - 数据源方法和代理方法
extension HMZMasterViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return foodTypes.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(cellId, forIndexPath: indexPath)
        cell.textLabel?.text = foodTypes[indexPath.row].name
        cell.textLabel?.textColor = UIColor.brownColor()
        cell.textLabel?.textAlignment = .Center
        return cell
    }
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if selectedIndexPath.item == indexPath.item {
            return
        }

        selectedIndexPath = indexPath
        let foodType = foodTypes[indexPath.row]
        if HMZCommon.share.isPad {
            foodTypeDelegate?.masterViewController?(self, didSelectedFoodType: foodType)
        } else if HMZCommon.share.isPhone {
            let detailVc = HMZDetailViewController()
            detailVc.foodType = foodType
            navigationController?.pushViewController(detailVc, animated: true)
        }
        
    }
}
