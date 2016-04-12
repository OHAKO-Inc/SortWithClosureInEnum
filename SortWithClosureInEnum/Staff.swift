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
        Staff(name: "Emma Bradley", staffId: 0, staffCardId: "0NRmctQ4bN"),
        Staff(name: "Alice Baker", staffId: 1, staffCardId: "9aqMmSGQOH"),
        Staff(name: "Edward Diaz", staffId: 2, staffCardId: "dv9Mfn2NHE"),
        Staff(name: "Heather Contreras", staffId: 3, staffCardId: "r7gbz4BFtS"),
        Staff(name: "Dorothy Bennett", staffId: 4, staffCardId: "PKM9gRWfRg"),
        Staff(name: "Cheryl Little", staffId: 5, staffCardId: "QQctcOmfMa"),
        Staff(name: "Harry Sims", staffId: 6, staffCardId: "r6SkJVldYZ"),
        Staff(name: "Christine Bennett", staffId: 7, staffCardId: "7szJuKg4H0"),
        Staff(name: "Jane Clark", staffId: 8, staffCardId: "4RavmUyy9e"),
        Staff(name: "Vincent Howard", staffId: 9, staffCardId: "7JGt7NLiAM")
    ]
    
    // Names were generated at http://uinames.com/
    // Card-IDs were generated at https://www.random.org/strings/
}
