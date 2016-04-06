//
//  StaffOrder.swift
//  SortWithClosureInEnum
//
//  Created by Yoshikuni Kato on 2016/04/06.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import Foundation

enum Order {
    case Ascending
    case Descending
}

enum StaffOrder {

    case Name(order: Order)
    case StaffId(order: Order)
    case StaffCardId(order: Order)
    case None
    
    var isOrderedBefore: ((Staff, Staff) -> Bool)? {
        
        switch self {
        case .Name(order: .Ascending):
            return { $0.name < $1.name }
        case .Name(order: .Descending):
            return { $0.name > $1.name }
            
        case .StaffId(order: .Ascending):
            return { $0.staffId < $1.staffId }
        case .StaffId(order: .Descending):
            return { $0.staffId > $1.staffId }

        case.StaffCardId(order: .Ascending):
            return { $0.staffCardId < $1.staffCardId }
        case .StaffCardId(order: .Descending):
            return { $0.staffCardId > $1.staffCardId }
            
        case .None:
            return nil
        }
    }
}
