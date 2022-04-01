//
//  Item.swift
//  SomeNetworkJob
//
//  Created by Maksim Ponomarev on 01.04.2022.
//

import Foundation

struct ItemRequestParams: Codable {
    let index: Int
}

struct Item: Equatable {
    var name: String
}
