//
//  ViewController.swift
//  TableView_Test3
//
//  Created by LeeX on 9/22/19.
//  Copyright © 2019 LeeX. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var collectionView: UICollectionView!
    
    var subView = SubView.collection
    
    private var viewModel: ViewModel!
    
    private var cellReuseId: String {
        get {
            return viewModel.cellReuseId
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        viewModel = ViewModel(withSubView: subView)
        setUpSubView()
        setUpData()
    }
    
    private func setUpData() {
        viewModel.setupData { [unowned self] (subview) in
            switch subview {
            case .collection:
                self.collectionView.reloadData()
            case .table:
                self.tableView.reloadData()
            }
        }
    }
    
    private func setUpSubView() {
        switch viewModel.currentSubView {
        case .table:
            setUpTableView()
        case .collection:
            setUpCollectionView()
        }
    }
    
    private func showTable(_ value: Bool) {
        tableView.isHidden = !value
        collectionView.isHidden = value
    }
    
    private func setUpTableView() {
        showTable(true)
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsSelection = false
        tableView.register(UINib(nibName: cellReuseId, bundle: nil),
                           forCellReuseIdentifier: cellReuseId)
    }
    
    private func setUpCollectionView() {
        showTable(false)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.allowsSelection = false
        collectionView.collectionViewLayout = viewModel.layout
        collectionView.register(UINib(nibName: cellReuseId, bundle: nil),
                                forCellWithReuseIdentifier: cellReuseId)
    }
    
    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        if subView == .collection {
            viewModel.columns = 1
            viewModel.layout.estimatedItemSize = viewModel.estimatedItemSize
        }
        super.traitCollectionDidChange(previousTraitCollection)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if subView == .collection {
            viewModel.columns = 1
            viewModel.layout.estimatedItemSize = viewModel.estimatedItemSize
            viewModel.layout.invalidateLayout()
        }
        super.viewWillTransition(to: size, with: coordinator)
    }

}

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.rows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellReuseId, for: indexPath) as! DynamicCell
        cell.binding(with: viewModel.data(at: indexPath.row))
        return cell
    }
}


extension ViewController: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.rows()
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseId, for: indexPath) as! DynamicCollectionCell
        cell.binding(with: viewModel.data(at: indexPath.row))
        return cell
    }

}
