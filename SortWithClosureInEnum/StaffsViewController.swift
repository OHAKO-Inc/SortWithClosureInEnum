//
//  StaffsViewController.swift
//  SortWithClosureInEnum
//
//  Created by Yoshikuni Kato on 2016/04/06.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import UIKit

final class StaffsViewController: UIViewController {

    private var staffs = Staff.staffs
    private var sortOrder: StaffOrder = .None {
        didSet {
            sortStaffs(sortOrder)
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    
    private func sortStaffs(order: StaffOrder) {
        guard let isOrderedBefore = order.isOrderedBefore else {
            return
        }
        staffs.sortInPlace(isOrderedBefore)
        tableView.reloadData()
    }
    
    
    @IBAction func nameButtonTapped(sender: AnyObject) {
        switch sortOrder {
        case .Name(order: .Ascending):
            sortOrder = .Name(order: .Descending)
        default:
            sortOrder = .Name(order: .Ascending)
        }
    }
    @IBAction func staffIdButtonTapped(sender: AnyObject) {
        switch sortOrder {
        case .StaffId(order: .Ascending):
            sortOrder = .StaffId(order: .Descending)
        default:
            sortOrder = .StaffId(order: .Ascending)
        }
    }
    @IBAction func staffCardIdButtonTapped(sender: AnyObject) {
        switch sortOrder {
        case .StaffCardId(order: .Ascending):
            sortOrder = .StaffCardId(order: .Descending)
        default:
            sortOrder = .StaffCardId(order: .Ascending)
        }
    }

}

extension StaffsViewController: UITableViewDataSource {
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return staffs.count
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier(String(StaffTableViewCell), forIndexPath: indexPath) as! StaffTableViewCell
        let staff = staffs[indexPath.row]
        cell.configure(
            name: staff.name,
            staffId: "\(staff.staffId)",
            staffCardId: staff.staffCardId
        )
        return cell
    }
}
