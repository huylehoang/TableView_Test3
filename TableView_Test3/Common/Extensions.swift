//
//  Extensions.swift
//  TableView_Test3
//
//  Created by LeeX on 9/22/19.
//  Copyright © 2019 LeeX. All rights reserved.
//

import Foundation
import UIKit

extension String.StringInterpolation {
    mutating func appendInterpolation(repeat str: String, _ count: Int) {
        for _ in 0 ..< count {
            appendLiteral(str)
        }
    }
}

extension String {
    func `repeat`(_ times: Int) -> String {
        return "\(repeat: self, times)"
    }
    
    func randomRepeat(baseOn subview: SubView) -> String {
        switch subview {
        case .collection:
            return self.repeat(Int.random(in: 2...5))
        case .table:
            return self.repeat(Int.random(in: 2...10))
        }
        
    }
}
