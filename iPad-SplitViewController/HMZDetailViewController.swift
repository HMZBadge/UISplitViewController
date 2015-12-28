//
//  HMZDetailViewController.swift
//  iPad-SplitViewController
//
//  Created by 赵志丹 on 15/12/28.
//  Copyright © 2015年 HMZBadge. All rights reserved.
//

import UIKit

class HMZDetailViewController: UITableViewController {
   
    var foods: [HMZFood] = HMZFood.foods("1")!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //tableView.registerClass(HMZFoodViewCell.self, forCellReuseIdentifier: cellID)
        HMZFoodViewCell()
    }
    
    
    
}

// MARK: - Table view data source
extension HMZDetailViewController {
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return foods.count
    }
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = HMZFoodViewCell.cellWithTableView(tableView)

        cell.food = foods[indexPath.row]
        print(cell.food)
        return cell
    }
}
