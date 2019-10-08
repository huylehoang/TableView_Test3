//
//  CellComponents.swift
//  TableView_Test3
//
//  Created by LeeX on 9/30/19.
//  Copyright © 2019 LeeX. All rights reserved.
//

import Foundation

enum CellComponents {
    case title, detail
    
    var restorationId: String {
        switch self {
        case .title:
            return "cell_title"
        case .detail:
            return "cell_detail"
        }
    }
}
