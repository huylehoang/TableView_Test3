//
//  ViewModel.swift
//  TableView_Test3
//
//  Created by LeeX on 9/22/19.
//  Copyright © 2019 LeeX. All rights reserved.
//

import Foundation
import UIKit

enum SubView: String {
    case table, collection
    
    fileprivate var cellReuseIdentifier: String {
        switch self {
        case .table:
            return "DynamicCell"
        case .collection:
            return "DynamicCollectionCell"
        }
    }
}

class ViewModel {
    lazy private var _layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.estimatedItemSize = estimatedItemSize
        layout.sectionInset = UIEdgeInsets(top: 0, left: 8, bottom: 0, right: 0)
        return layout
    }()
    
    lazy private var spacing: CGFloat = {
        return 32
    }()
    
    var estimatedItemSize: CGSize {
        get {
            return CGSize(width: UIScreen.main.bounds.width / CGFloat(columns) - spacing, height: 1)
        }
    }
    
    lazy var columns: Int = {
        return 1
    }()
    
    struct CellModel {
        var title: String
        var subTitle: String
    }
    
    private var _subView = SubView.table
    
    private var data = [CellModel]()
    
    init(withSubView subview: SubView) {
        _subView = subview
    }
    
    private func valid(_ index: Int) -> Bool {
        return index >= 0 && index < data.count
    }
    
    func setupData(completion: @escaping (SubView) -> ()) {
        APIClient.getData(baseOn: currentSubView) { [weak self] (data) in
            guard let `self` = self else { return }
            self.data.append(contentsOf: data)
            completion(self.currentSubView)
        }
    }
    
    func rows() -> Int {
        return data.count
    }
    
    func data(at index: Int) -> CellModel? {
        return valid(index) ? data[index] : nil
    }
}

extension ViewModel {
    var layout: UICollectionViewFlowLayout {
        get {
            return _layout
        }
    }
    
    
    var currentSubView: SubView {
        get {
            return _subView
        }
    }
    
    var cellReuseId: String {
        get {
            return _subView.cellReuseIdentifier
        }
    }
}
