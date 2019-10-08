//
//  APIClient.swift
//  TableView_Test3
//
//  Created by LeeX on 9/22/19.
//  Copyright © 2019 LeeX. All rights reserved.
//

import Foundation
private let sampleText = "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Praesent nibh ex, sagittis interdum tincidunt quis, varius dictum nibh. Aliquam sit amet urna tellus"
class APIClient {
    static func getData(baseOn subview: SubView, completion: @escaping ([ViewModel.CellModel]) -> ()) {
        var data = [ViewModel.CellModel]()
        for i in 0...Int.random(in: 10...100) {
            data.append(ViewModel.CellModel(title: "Title \(i + 1)", subTitle: sampleText.randomRepeat(baseOn: subview)))
        }
        completion(data)
    }
}

