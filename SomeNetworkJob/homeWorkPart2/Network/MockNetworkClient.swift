//
//  MockNetworkClient.swift
//  SomeNetworkJob
//
//  Created by Maksim Ponomarev on 01.04.2022.
//

import Foundation

enum MockNetworkClientError: Error {
    case stubError
}


final class MockNetworkClient<R>: NetworkClient {

    typealias Response = R
    typealias Completion = (Response?, Error?) -> ()

    var stubError: Bool = false
    var stubResponse: R?
    var badResponse: Bool = false
    
    func networkRequest<P: Codable>(params: P, completion: @escaping Completion) {
        
        if stubError {
            completion(nil, MockNetworkClientError.stubError)
        } else if badResponse {
            completion(nil, ServiceError.badResponse)
        }  else {
            completion(stubResponse, nil)
        }
    }
}
