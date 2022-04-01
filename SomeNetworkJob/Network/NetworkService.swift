//
//  NetworkService.swift
//  SomeNetworkJob
//
//  Created by Maksim Ponomarev on 01.04.2022.
//

import Foundation

final class NetworkService<C: NetworkClient> {
    
    enum ServiceError: Error {
        case badResponse
    }
    
    typealias Completion = (Item?, Error?) -> ()
    typealias Parameters = [String: Int]
    
    private let client: C
    
    init(client: C) {
        self.client = client
    }
    
    
    func fetchItem(at index: Int, completion: @escaping Completion) {
        let params = ItemRequestParams(index: index)
        client.networkRequest(params: params) { (response, error) in
            if let error = error {
                completion(nil, error)
            } else if let item = response as? Item {
                completion(item, nil)
            } else {
                completion(nil, ServiceError.badResponse)
            }
            
        }
    }
}
