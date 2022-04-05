//
//  NetworkClient.swift
//  SomeNetworkJob
//
//  Created by Maksim Ponomarev on 01.04.2022.
//

import Foundation

protocol NetworkClient {

    associatedtype Response

    typealias Completion = (Response?, Error?) -> ()

    func networkRequest<P: Codable>(params: P, completion: @escaping Completion)
}

final class ItemNetworkClient: NetworkClient {

    typealias Response = Item

    func networkRequest<P: Codable>(params: P, completion: @escaping Completion) {
        // здесь происходит реальный сетевой запрос
    }
}
