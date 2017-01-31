//
//  StaffsViewController.swift
//  SortWithClosureInEnum
//
//  Created by Yoshikuni Kato on 2016/04/06.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import UIKit

final class StaffsViewController: UIViewController {

    fileprivate var staffs = Staff.staffs
    fileprivate var sortOrder: StaffOrder = .none {
        didSet {
            sortStaffs(sortOrder)
            updateButtons(sortOrder)
        }
    }
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var nameButton: CustomButton!
    @IBOutlet weak var staffIdButton: CustomButton!
    @IBOutlet weak var staffCardIdButton: CustomButton!
    
    fileprivate func sortStaffs(_ order: StaffOrder) {
        guard let isOrderedBefore = order.isOrderedBefore else {
            return
        }
        staffs.sort(by: isOrderedBefore)
        tableView.reloadData()
    }
    
    fileprivate func updateButtons(_ sortOrder: StaffOrder) {
        
        nameButton.setTitle("Name", for: UIControlState())
        staffIdButton.setTitle("Staff ID", for: UIControlState())
        staffCardIdButton.setTitle("Staff Card ID", for: UIControlState())
        
        switch sortOrder {
        case .name(order: .ascending):
            nameButton.setTitle("Name ▼", for: UIControlState())
        case .name(order: .descending):
            nameButton.setTitle("Name ▲", for: UIControlState())

        case .staffId(order: .ascending):
            staffIdButton.setTitle("Staff ID ▼", for: UIControlState())
        case .staffId(order: .descending):
            staffIdButton.setTitle("Staff ID ▲", for: UIControlState())

        case .staffCardId(order: .ascending):
            staffCardIdButton.setTitle("Staff Card ID ▼", for: UIControlState())
        case .staffCardId(order: .descending):
            staffCardIdButton.setTitle("Staff Card ID ▲", for: UIControlState())
            
        case .none:
            break
        }
    }
    
    @IBAction func nameButtonTapped(_ sender: AnyObject) {
        if case .name(order: .ascending) = sortOrder {
            sortOrder = .name(order: .descending)
        } else {
            sortOrder = .name(order: .ascending)
        }
    }
    @IBAction func staffIdButtonTapped(_ sender: AnyObject) {
        if case .staffId(order: .ascending) = sortOrder {
            sortOrder = .staffId(order: .descending)
        } else {
            sortOrder = .staffId(order: .ascending)
        }
    }
    @IBAction func staffCardIdButtonTapped(_ sender: AnyObject) {
        if case .staffCardId(order: .ascending) = sortOrder {
            sortOrder = .staffCardId(order: .descending)
        } else {
            sortOrder = .staffCardId(order: .ascending)
        }
    }

}

extension StaffsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return staffs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: String(describing: StaffTableViewCell.self), for: indexPath) as! StaffTableViewCell
        let staff = staffs[indexPath.row]
        cell.configure(
            name: staff.name,
            staffId: "\(staff.staffId)",
            staffCardId: staff.staffCardId
        )
        return cell
    }
}
