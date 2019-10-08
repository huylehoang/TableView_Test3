//
//  DynamicCell.swift
//  TableView_Test3
//
//  Created by LeeX on 9/23/19.
//  Copyright © 2019 LeeX. All rights reserved.
//

import UIKit

class DynamicCell: UITableViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        commonInit()
        setup()
    }
    
    private func commonInit() {
        lblTitle.restorationIdentifier = CellComponents.title.restorationId
        lblDetail.restorationIdentifier = CellComponents.detail.restorationId
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}

