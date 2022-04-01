//
//  Engine_mock.swift
//  SomeNetworkJobTests
//
//  Created by Maksim Ponomarev on 01.04.2022.
//

import Foundation

class Engine_mock: Engine {
    var ignitionCount: Int = 0
    var turnOnCount: Int = 0
    var turnOnValue: Bool = true
    var setEngineSpeedCount: Int = 0
    var setEngineSpeedValue: Int?
    
    override func turnOn() -> Bool {
        turnOnCount += 1
        return turnOnValue
    }
    
    override func ignitionOn() {
        ignitionCount += 1
    }
    override func setEngineSpeed(_ speed: Int) {
        setEngineSpeedCount += 1
        setEngineSpeedValue = speed
    }
}
