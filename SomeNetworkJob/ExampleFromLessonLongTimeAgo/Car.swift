//
//  Car.swift
//  SomeNetworkJob
//
//  Created by Maksim Ponomarev on 01.04.2022.
//

import Foundation

class Car {
    private let engine: Engine
    
    init(engine: Engine) {
        self.engine = engine
    }
    
    func ignition() {
        engine.ignitionOn()
    }
    
    func turnOn() -> Bool {
        return engine.turnOn()
    }
    
    func ride(with speed: Int) {
        let engineSpeed = speed / 2
        engine.setEngineSpeed(engineSpeed)
    }
    
}

enum EngineState {
    case off, ignitionOn, idle, ride
}

class Engine {
    private(set) var engineSpeed: Int = 0
    private(set) var state: EngineState = .off
    
    func ignitionOn() {
        state = . ignitionOn
    }
    
    func turnOn() -> Bool {
        if state == .ignitionOn {
            state = .idle
            return true
        }
        return false
    }
    
    func setEngineSpeed(_ speed: Int) {
        engineSpeed = speed
    }
}
