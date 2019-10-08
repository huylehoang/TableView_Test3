//
//  DynamicCollectionCell.swift
//  TableView_Test3
//
//  Created by LeeX on 9/30/19.
//  Copyright © 2019 LeeX. All rights reserved.
//

import UIKit

class DynamicCollectionCell: UICollectionViewCell {

    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var lblDetail: UILabel!
    
    lazy private var width: NSLayoutConstraint = {
        let width = contentView.widthAnchor.constraint(equalToConstant: bounds.size.width)
        width.isActive = true
        return width
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        contentView.translatesAutoresizingMaskIntoConstraints = false
        commonInit()
        setup()
    }
    
    private func commonInit() {
        lblTitle.restorationIdentifier = CellComponents.title.restorationId
        lblDetail.restorationIdentifier = CellComponents.detail.restorationId
    }
    
    override func systemLayoutSizeFitting(_ targetSize: CGSize, withHorizontalFittingPriority horizontalFittingPriority: UILayoutPriority, verticalFittingPriority: UILayoutPriority) -> CGSize {
        width.constant = bounds.size.width
        return contentView.systemLayoutSizeFitting(CGSize(width: targetSize.width, height: 1))
    }
}
