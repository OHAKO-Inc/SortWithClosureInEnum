//
//  Staff.swift
//  SortWithClosureInEnum
//
//  Created by Yoshikuni Kato on 2016/04/06.
//  Copyright © 2016年 Ohako Inc. All rights reserved.
//

import UIKit

struct Staff {
    let name: String
    let staffId: Int
    let staffCardId: String
}

extension Staff {
    static let staffs = [
        Staff(name: "A", staffId: 0, staffCardId: "AAA"),
        Staff(name: "B", staffId: 1, staffCardId: "BBB")
    ]
}
