//
//  ApiClient.swift
//  SomeNetworkJob
//
//  Created by Maksim Ponomarev on 01.04.2022.
//

import Foundation
import Combine

class ApiClient {
    
    private let decoder = JSONDecoder()
    private let queue = DispatchQueue(label: "API", qos: .background, attributes: .concurrent)
    
    init() { }
    
    func fetchData(urlString: String) -> AnyPublisher<[PersonInfo], Never> {
        URLSession.shared.dataTaskPublisher(for: URL(string: urlString)!)
            .print()
            .receive(on: queue)
            .map(\.data)
            .decode(type: [PersonInfo].self, decoder: decoder)
            .catch({ _ in Empty<[PersonInfo], Never>()  })
            .eraseToAnyPublisher()
        
    }
}
