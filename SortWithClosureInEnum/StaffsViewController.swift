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
            updateButtons(sortOrder)
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameButton: CustomButton!
    @IBOutlet weak var staffIdButton: CustomButton!
    @IBOutlet weak var staffCardIdButton: CustomButton!
    
    private func sortStaffs(order: StaffOrder) {
        guard let isOrderedBefore = order.isOrderedBefore else {
            return
        }
        staffs.sortInPlace(isOrderedBefore)
        tableView.reloadData()
    }
    
    private func updateButtons(sortOrder: StaffOrder) {
        
        nameButton.setTitle("Name", forState: .Normal)
        staffIdButton.setTitle("Staff ID", forState: .Normal)
        staffCardIdButton.setTitle("Staff Card ID", forState: .Normal)
        
        switch sortOrder {
        case .Name(order: .Ascending):
            nameButton.setTitle("Name ▼", forState: .Normal)
        case .Name(order: .Descending):
            nameButton.setTitle("Name ▲", forState: .Normal)

        case .StaffId(order: .Ascending):
            staffIdButton.setTitle("Staff ID ▼", forState: .Normal)
        case .StaffId(order: .Descending):
            staffIdButton.setTitle("Staff ID ▲", forState: .Normal)

        case .StaffCardId(order: .Ascending):
            staffCardIdButton.setTitle("Staff Card ID ▼", forState: .Normal)
        case .StaffCardId(order: .Descending):
            staffCardIdButton.setTitle("Staff Card ID ▲", forState: .Normal)
            
        case .None:
            break
        }
    }
    
    @IBAction func nameButtonTapped(sender: AnyObject) {
        if case .Name(order: .Ascending) = sortOrder {
            sortOrder = .Name(order: .Descending)
        } else {
            sortOrder = .Name(order: .Ascending)
        }
    }
    @IBAction func staffIdButtonTapped(sender: AnyObject) {
        if case .StaffId(order: .Ascending) = sortOrder {
            sortOrder = .StaffId(order: .Descending)
        } else {
            sortOrder = .StaffId(order: .Ascending)
        }
    }
    @IBAction func staffCardIdButtonTapped(sender: AnyObject) {
        if case .StaffCardId(order: .Ascending) = sortOrder {
            sortOrder = .StaffCardId(order: .Descending)
        } else {
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
