//
//  main.swift
//  lesTree
//
//  Created by Евгений Ефименко on 28.11.2021.
//

import Foundation

enum CarState {
    case startedEngine
    case stopEngine
    case openWindow
    case closeWindow
    case openHood
    case closeHood
    case originalMileage
    case unoriginalЬileage
}
enum Weather {
    case rain
    case sun
    case snow
}
enum CarCondition {
    case RunDrive
    case VehicleStarts
    case VehiclesKeys
}
enum CarBodyType {
    case cabriolet
    case sedan
    case hatchback
    case universal
    case suv
}
enum CarModel {
    case monza
    case peterbilt

}
enum FuelQuantity {
    case fullTank
    case emptyTank
}
enum TruckBody {
    case load(with: Int)
    case unLoad(with: Int)
}
enum TrailerStatus {
    case hitched
    case unattached
}

struct SportKar {
    let carBrand: String
    let model: String
    var bodyType: CarBodyType
    let color: String
    let carPower: Int
    let year: Int
    var isEngineStarted: Bool
    var isWindowOpen: Bool
    var condition: CarCondition
    var isMileageOriginal: Bool
    var isHoodOpen: Bool

    mutating func changeEngineStatus(newAction: CarState) {
        switch newAction {
        case .startedEngine:
            isEngineStarted = true
        default:
            isEngineStarted = false
        }
    }

    mutating func changeWindowStatus(newAction: CarState) {
        switch newAction {
        case .openWindow:
            isWindowOpen = true
        default:
            isWindowOpen = false
        }
    }

    mutating func changeHoodStatus(newAction: CarState) {
        switch newAction {
        case .openHood:
            isHoodOpen = true
        default:
            isHoodOpen = false
        }
    }

    mutating func mileageStatus(newAction: CarState) {
        switch newAction {
        case .originalMileage:
            isMileageOriginal = true
        default:
            isMileageOriginal = false
        }
    }

    mutating func changeModel(weatherForecast: Weather) {
        switch weatherForecast {
        case .rain:
            bodyType = .sedan
            print("Сделал правильный выбор")
        case .sun:
            bodyType = .cabriolet
            print("Для такой погоды только Кабриолет")
        case .snow:
            bodyType = .suv
            print("Снег нам не страшен")
        }
    }
}

struct TrunkCar {
    let carBrand: String
    var model: String
    var bodyType: CarBodyType
    var color: String
    let year: Int
    var carPower: Int
    var trunkVolume: Double
    var isEngineTruck: Bool
    var isWindowOpen: Bool
    var trunkFull: Int
    var trunkUsed = 0
    var condition: CarCondition
    var mileage: Int
    var engineError: CarState

    mutating func changeColor(newColor: String) {
        switch newColor {
        case "Red":
            color = "Красный"
            print("Красим в Красный цвет")
        case "White":
            color = "Белый"
            print("Красим в Белый цвет")
        case "Blue":
            color = "Синий"
            print("Красим в Синий цвет")
        case "Pink":
            color = "Розовый"
            print("Красим в Розовый цвет")
        case "Orange":
            color = "Оранжевый"
            print("Красим в Оранжевый цвет")
        default:
            print("Доступные цвета Красный, Белый, Синий, Розовый")
        }
    }

    mutating func changeVolume(trailerStatus: TrailerStatus , spaceInTrunk: TruckBody) {
        if trailerStatus == .unattached {
            print("Нужно подцепить прицеп")
        } else {
            switch spaceInTrunk {
            case .load(let volume ):
                if volume > (trunkFull - trunkUsed) {
                    print("В грузовике \(carBrand) объём прицепа составляет всего \(trunkFull) литров, места нет.")
                }
            case .unLoad(let newVolume):
                trunkUsed -= newVolume
                print("В прицепе осталось еще \(trunkUsed) литров cвободного места")
            }
        }
    }

    mutating func engineStatus(newAction: CarState) {
        switch newAction {
        case .startedEngine:
            isEngineTruck = true
        default:
            isEngineTruck = false
        }
    }
}

var ferrari = SportKar(carBrand: "Ferrari",
                       model: "Monza",
                       bodyType: .sedan,
                       color: "Красный",
                       carPower: 500,
                       year: 1988,
                       isEngineStarted: true,
                       isWindowOpen: false,
                       condition: .RunDrive,
                       isMileageOriginal: true,
                       isHoodOpen: true)

print("Спортивный автомобиль \(ferrari .carBrand)","\(ferrari .model) произведен в \(ferrari .year) году.")
print("Цвет автомобиля \(ferrari.color).")
print("Текущее состояние окон: \(ferrari.isWindowOpen).")
print("Мощность двигателя составляет \(ferrari.carPower)")

ferrari.changeEngineStatus(newAction: .stopEngine)
ferrari.changeWindowStatus(newAction: .closeWindow)

var peterbilt = TrunkCar(carBrand: "Peterbilt",
                         model: "387",
                         bodyType: .suv,
                         color: "Белый",
                         year: 2016,
                         carPower: 800,
                         trunkVolume: 90.1,
                         isEngineTruck: false,
                         isWindowOpen: false,
                         trunkFull: 90,
                         trunkUsed: 10,
                         condition: .RunDrive,
                         mileage: 200000,
                         engineError: .startedEngine)
print("----------------")
print("Тягач \(peterbilt.carBrand) произведен в \(peterbilt.year) году.")
print("Мощность двигателя составляет \(peterbilt.carPower) лошадиных сил.")
print("Цвет грузовика \(peterbilt.color).")
print("Максимальный объём прицепа составляет \(peterbilt .trunkVolume) литров")

peterbilt.changeColor(newColor: "Синий")
peterbilt.changeVolume(trailerStatus: .hitched, spaceInTrunk: TruckBody.load(with: 10000))

print("Thx")

