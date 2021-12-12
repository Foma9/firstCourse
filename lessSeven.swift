//
//  main.swift
//  less7
//
//  Created by Евгений Ефименко on 12.12.2021.
//

import Foundation

//MARK: - Enums

enum EngineState {
    case stop
    case start
}

enum CarError: Error {
    case noFuel
    case engineBroke
}

//MARK: ClassCar and Guard

final class Car {

    var fuel: Int
    var engineWork: Bool
    private var engineState: EngineState

    init(fuel: Int,
         engineWork: Bool,
         engineState: EngineState)
    {
        self.engineWork = engineWork
        self.fuel = fuel
        self.engineState = .stop
    }

    func doEngine() throws {

        switch engineState {
        case .stop:
            guard fuel > 0 else { throw CarError.noFuel }
            guard engineWork else { throw CarError.engineBroke }
            engineState = .start
            print("Двигатель запущен")
        case .start:
            engineState = .stop
            print("Двигатель не запущен")
        }
    }
}

//MARK: - Operations

var audi = Car(fuel: 50, engineWork: true, engineState: .stop)

audi.engineWork = false

do {
    try audi.doEngine()
} catch CarError.noFuel {
    print("Сорян, нет топлива")
} catch CarError.engineBroke {
    print("Двигатель вышел из чата, придется идти пешком")
}

audi.fuel = 0

do {
    try audi.doEngine()
} catch CarError.noFuel {
    print("Сорян, нет топлива")
} catch CarError.engineBroke {
    print("Двигатель вышел из чата, придется идти пешком")
}

audi.engineWork = true
audi.fuel = 80

do {
    try audi.doEngine()
} catch CarError.noFuel {
    print("Сорян, нет топлива")
} catch CarError.engineBroke {
    print("Двигатель вышел из чата, придется идти пешком")
}


