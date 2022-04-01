//
//  untitleTest.swift
//  SomeNetworkJobTests
//
//  Created by Maksim Ponomarev on 01.04.2022.
//

import XCTest
@testable import SomeNetworkJob

class untitleTest: XCTestCase {

    func testIgnition() {
        let engine = Engine_mock()
        let car = Car(engine: engine)
        car.ignition()
        
        XCTAssert((engine.ignitionCount == 1), "engine.ignitionCount: \(engine.ignitionCount == 1)")
        
    }
    
    func testTurnON() {
        let engine = Engine_mock()
        let car = Car(engine: engine)
        
        engine.turnOnValue = true
        let result = car.turnOn()
        
        XCTAssert((result), "engine.turnOnValue: \(result)")
        XCTAssertEqual(engine.turnOnCount, 1, "engine.turnOnCount: \(result)")
    }
    

}
