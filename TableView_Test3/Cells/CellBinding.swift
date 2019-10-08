//
//  CellBinding.swift
//  TableView_Test3
//
//  Created by LeeX on 9/30/19.
//  Copyright © 2019 LeeX. All rights reserved.
//

import Foundation
import UIKit

protocol CellBinding {
    func setup()
    func binding(with data: ViewModel.CellModel?)
}

private extension CellBinding where Self: UIView {
    
    func getLabel(_ component: CellComponents) -> UILabel? {
        if let tableCell = self as? UITableViewCell {
            return tableCell.contentView.subviews.first?.subviews
                .filter({ $0.restorationIdentifier == component.restorationId }).first as? UILabel
        } else if let collectionCell = self as? UICollectionViewCell {
            return collectionCell.contentView.subviews.first?.subviews
                .filter({ $0.restorationIdentifier == component.restorationId }).first as? UILabel
        }
        return nil
    }
    
    func setupUI() {
        if let lblTitle = getLabel(.title) {
            lblTitle.font = .systemFont(ofSize: 24.0, weight: .medium)
            lblTitle.textColor = .lightGray
        }
        if let lblDetail = getLabel(.detail) {
            lblDetail.font = .systemFont(ofSize: 16.0, weight: .regular)
            lblDetail.textColor = .black
        }
    }
    
    func bindingData(_ data: ViewModel.CellModel?) {
        if let lblTitle = getLabel(.title) {
            lblTitle.text = data?.title
        }
        if let lblDetail = getLabel(.detail) {
            lblDetail.text = data?.subTitle
        }
    }
}

extension DynamicCell: CellBinding {}

extension CellBinding where Self: DynamicCell {
    func setup() {
        selectionStyle = .none
        setupUI()
    }
    
    func binding(with data: ViewModel.CellModel?) {
        bindingData(data)
    }
}


extension DynamicCollectionCell: CellBinding {}

extension CellBinding where Self: DynamicCollectionCell {
    func setup() {
        setupUI()
    }
    
    func binding(with data: ViewModel.CellModel?) {
        bindingData(data)
    }
}
