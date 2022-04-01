//
//  SomeNetworkJobTests.swift
//  SomeNetworkJobTests
//
//  Created by Maksim Ponomarev on 01.04.2022.
//

import XCTest
@testable import SomeNetworkJob

class SomeNetworkJobTests: XCTestCase {

    var sut: NetworkService<MockNetworkClient<Item>>!
    var client: MockNetworkClient<Item>!
    
    override func setUp() {
        super.setUp()
        
        client = MockNetworkClient<Item>()
        sut = NetworkService<MockNetworkClient<Item>>(client: client)
    }
    override func tearDown() {
        client = nil
        sut = nil
        
        super.tearDown()
    }
    func testServiceCanReceiveResult() {
        let expectedItem = Item(name: "test")
        var resultItem: Item?
        client.stubResponse = expectedItem
        
        sut.fetchItem(at: 0) { (item, _) in
            resultItem = item
        }
        XCTAssertEqual(expectedItem, resultItem)
    }
    
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
