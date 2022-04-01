//
//  PersonInfo.swift
//  SomeNetworkJob
//
//  Created by Maksim Ponomarev on 01.04.2022.
//
/*
 Дан url <https://jsonplaceholder.typicode.com/users> со списком объектов.
 Задание: вывести список этих объектов в UICollectionView.
 Написать тесты.
 Выбор архитектуры — за вами. Отображение картинок можно игнорировать. Реализуйте требуемую функциональность и замерьте время на реализацию. Если не уложились в норматив 1 час 10 минут — продолжайте тренироваться.
 */

import Foundation

struct PersonInfo: Codable, CustomStringConvertible, Hashable {
    
    
    public var description: String {
        "name = \(name)"
    }
    let id: Int
    let name, username, email: String
    let address: Address
    let phone, website: String
    let company: Company
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: PersonInfo, rhs: PersonInfo) -> Bool {
        return lhs.id == rhs.id
    }
    
    
}

// MARK: - Address
struct Address: Codable {
    let street, suite, city, zipcode: String
    let geo: Geo
}

// MARK: - Geo
struct Geo: Codable {
    let lat, lng: String
}

// MARK: - Company
struct Company: Codable {
    let name, catchPhrase, bs: String
}


