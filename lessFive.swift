//
//  main.swift
//  less5
//
//  Created by Евгений Ефименко on 06.12.2021.
//

import Foundation

// MARK: - Enums

enum EngineStatus {
    case on
    case off
}

enum WindowsStatus {
    case open
    case close
}

enum WheelsStatus {
    case pumpedUp
    case deflated
}

enum TrunkType {
    case milkTank
    case benzineTank
    case diselTank
}

enum CarType {
    case sedan
    case cabriolet
    case limusine
}

// MARK: - CarProtokol

protocol CarProtokol {

    var brand: String { get set }
    var color: String { get set }
    var milage: Double {get set }
    var year: Int { get set }
    var engineStatus: EngineStatus { get set }
    var windowsStatus: WindowsStatus { get set }
    var wheelsStatus: WheelsStatus { get set }

    func action()
}

// MARK: - Extension CarProtocol

extension CarProtokol {

    mutating func engineStart() {
        switch engineStatus {
        case .on:
            print("Повторный запуск не возможен, двигатель работает")
        case .off:
            engineStatus = .on
            print("Двигатель запущен")
        }
    }

    mutating func engineStop() {
        switch engineStatus {
        case .on:
            engineStatus = .off
            print("Двигатель заглушен")
        case.off:
            print("Невозможно заглушить, двигатель не работает")
        }
    }

    mutating func pumpUpWheels() {
        switch wheelsStatus {
        case .pumpedUp:
            print("Опасно, колеса уже накачаны!")
        case .deflated:
            wheelsStatus = .pumpedUp
            print("Качаем колеса")
        }
    }

    mutating func pumpDownWheels() {
        switch wheelsStatus {
        case .pumpedUp:
            wheelsStatus = .deflated
            print("Колеса спущены")
        case .deflated:
            wheelsStatus = .pumpedUp
            print("Колеса уже накачаны")
        }
    }

    mutating func windowsOpen() {
        switch windowsStatus {
        case .open:
            print("Окна уже открыт!")
        case .close:
            windowsStatus = .open
            print("Окна открыты")
        }
    }

    mutating func windowsClose() {
        switch windowsStatus {
        case .open:
            windowsStatus = .close
            print("Окна закрыты!")
        case .close:
            print("Окна закрыты")
        }
    }
}

// MARK: - Classes

final class SportCar: CarProtokol {
    var brand: String
    var color: String
    var year: Int
    var milage: Double
    var engineStatus: EngineStatus
    var windowsStatus: WindowsStatus
    var wheelsStatus: WheelsStatus
    var carType: CarType
    var isCarTuning: Bool

    init(brand: String,
         color: String,
         year: Int,
         milage: Double,
         engineStatus: EngineStatus,
         windowsStatus: WindowsStatus,
         wheelsStatus: WheelsStatus,
         carType: CarType,
         isCarTuning: Bool)
    {
        self.brand = brand
        self.color = color
        self.year = year
        self.milage = milage
        self.engineStatus = engineStatus
        self.windowsStatus = windowsStatus
        self.wheelsStatus = wheelsStatus
        self.carType =  carType
        self.isCarTuning = isCarTuning
    }

    func action() {
        switch engineStatus {
        case .on:
            print("Двигатель уже запущен \(brand) готов к выезду")
        case .off:
            engineStatus = .on
            print("Двигатель \(engineStatus). \(brand) готов к выезду")
        }
    }
}

final class TrunkCar: CarProtokol {
    var brand: String
    var color: String
    var year: Int
    var milage: Double
    var engineStatus: EngineStatus
    var windowsStatus: WindowsStatus
    var wheelsStatus: WheelsStatus
    var trukType: TrunkType

    init(brand: String,
         color: String,
         year: Int,
         milage: Double,
         engineStatus: EngineStatus,
         windowsStatus: WindowsStatus,
         wheelsStatus: WheelsStatus,
         trukType: TrunkType)
    {
        self.brand = brand
        self.color = color
        self.year = year
        self.milage = milage
        self.engineStatus = engineStatus
        self .windowsStatus = windowsStatus
        self.wheelsStatus = wheelsStatus
        self.trukType = trukType
    }

    func action() {
        switch engineStatus {
        case .on:
            print("Двигатель уже запущен \(brand) готов к выезду")
        case .off:
            engineStatus = .on
            print("Двигатель \(engineStatus). \(brand) готов к выезду")
        }
    }
}

// MARK: - CustomStringConvertible Extensions

extension SportCar: CustomStringConvertible {
    var description: String {
        return  """
                \nСпортивный автомобиль\nБренд: \(brand)
                \nЦвет: \(color)
                \nГод выпуска: \(year)
                \nПробег: \(milage)
                \nСтатус двигателя: \(engineStatus)
                \nСтатус окон: \(windowsStatus)
                \nТюнинг: \(isCarTuning)
                """
    }
}

extension TrunkCar: CustomStringConvertible {
    var description: String {
        return  """
                \nГрузовой автомобиль\nБренд: \(brand)
                \nЦвет: \(color)
                \nГод выпуска: \(year)
                \nПробег: \(milage)
                \nСтатус двигателя: \(engineStatus)
                \nСтатус окон: \(windowsStatus)
                \nСтатус колес: \(wheelsStatus)
                \nВид прицепа: \(trukType)
                """
    }
}

// MARK: - Initialization

var ferrari = SportCar(brand: "Ferrari",
                       color: "Red",
                       year: 2020,
                       milage: 1000.1,
                       engineStatus: .off,
                       windowsStatus: .close,
                       wheelsStatus: .pumpedUp,
                       carType: .cabriolet,
                       isCarTuning: false)
ferrari.engineStart()
ferrari.windowsOpen()
print(ferrari.description)
ferrari.engineStop()
ferrari.action()

var man = TrunkCar(brand: "MAN",
                   color: "Белый",
                   year: 2016,
                   milage: 200000,
                   engineStatus: .off,
                   windowsStatus: .close,
                   wheelsStatus: .deflated,
                   trukType: .milkTank)
man.windowsOpen()
man.pumpUpWheels()
print(man.description)
man.engineStart()
man.action()


