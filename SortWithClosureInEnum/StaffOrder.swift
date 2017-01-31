//
//  StaffOrder.swift
//  SortWithClosureInEnum
//
//  Created by Yoshikuni Kato on 2016/04/06.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import Foundation

enum Order {
    case ascending
    case descending
}

enum StaffOrder {

    case name(order: Order)
    case staffId(order: Order)
    case staffCardId(order: Order)
    case none
    
    var isOrderedBefore: ((Staff, Staff) -> Bool)? {
        
        switch self {
        case .name(order: .ascending):
            return { $0.name < $1.name }
        case .name(order: .descending):
            return { $0.name > $1.name }
            
        case .staffId(order: .ascending):
            return { $0.staffId < $1.staffId }
        case .staffId(order: .descending):
            return { $0.staffId > $1.staffId }

        case.staffCardId(order: .ascending):
            return { $0.staffCardId < $1.staffCardId }
        case .staffCardId(order: .descending):
            return { $0.staffCardId > $1.staffCardId }
            
        case .none:
            return nil
        }
    }
}
