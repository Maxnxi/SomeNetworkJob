//
//  ViewModelHW1.swift
//  SomeNetworkJob
//
//  Created by Maksim Ponomarev on 01.04.2022.
//

import Foundation
import UIKit
import Combine

protocol ViewModelHW1 {
    var titleLabel: String { get }
    var attributesForTitle: [NSAttributedString.Key: Any] { get }
    
    var persons: AnyPublisher<[PersonInfo], Never> { get }
}

class ViewModelHW1Impl: ViewModelHW1 {
//    private let model: ModelHW1
//
//    init(model: ModelHW1) {
//        self.model = model
//    }
    private let apiClient: ApiClient
    var persons: AnyPublisher<[PersonInfo], Never>
    
    init(apiClient: ApiClient){
        self.apiClient = apiClient
        self.persons = apiClient.fetchData(urlString: "https://jsonplaceholder.typicode.com/users")
    }
    
    
    var titleLabel: String {
        return "Homework part #1"
    }
    var attributesForTitle: [NSAttributedString.Key: Any] {
        return [NSAttributedString.Key.foregroundColor: UIColor.black,
                NSAttributedString.Key.font: UIFont(name: "Avenir", size: 25)]
    }
    
   
}
