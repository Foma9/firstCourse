//
//  main.swift
//  less4
//
//  Created by Евгений Ефименко on 03.12.2021.
//

import Foundation

//MARK: - Enums

enum CarBrand {
    case MercedesBenz
    case Honda
    case BMW
    case Peterbilt
    case Ferrari
}

enum CarEngine {
    case disel
    case benzine
    case gas
}

enum CarAction {
    case startEngine
    case stopEngine
    case truckLoaded
    case truckEmpty
}

//MARK: - Car Class

class Car {

    let brand: CarBrand
    let carYear: UInt
    let color: String
    let engineType: CarEngine
    let salePrice: Double

    init(brand: CarBrand,
         carYear: UInt,
         color: String,
         engineType: CarEngine,
         salePrice: Double)

    {
        self.brand = brand
        self.carYear = carYear
        self.color = color
        self.engineType = engineType
        self.salePrice = salePrice
    }

    func actionDone(state: CarAction) {

    }

    func displayScoreboard() {
        print("""
        Автомобиль в продаже: Марка: \(brand)
        Год выпуска:\(carYear)
        Тип двигателя: \(engineType)
        Цвет автомобиля: \(color)
        Цена: \(salePrice)
        """)
    }
}

//MARK: - SportСar

final class SportСar: Car {

    private let power: Int
    private let mileage: Int
    private let driveUnit: String
    private let licensePlate: String
    private var launch: CarAction = .startEngine

    init(brand: CarBrand,
         engineType: CarEngine,
         color: String,
         power: Int,
         mileage: Int,
         driveUnit: String,
         salePrice: Double,
         carYear: Int,
         licensePlate: String)
    {
        self.power = power
        self.mileage = mileage
        self.driveUnit = driveUnit
        self.licensePlate = licensePlate

        super.init(brand: brand,
                   carYear: 2020,
                   color: color,
                   engineType: engineType,
                   salePrice: salePrice)

    }

    override func actionDone(state: CarAction) {
        launch = state
        print("\nДвигатель запущен / выключен: \(state)")
    }

    override func displayScoreboard() {
        print("""
        Спортивный автомобиль в продаже:
        Марка: \(brand)
        Год выпуска:\(carYear)
        Тип двигателя: \(engineType)
        Цвет автомобиля: \(color)
        Мощьность: \(power)
        Пробег: \(mileage)
        Привод: \(driveUnit)
        Гос номер: \(licensePlate)
        Цена: \(salePrice)
        """)
    }
}

//MARK: - TruckCar

final class TrunkCar: Car {

    private let power: Int
    private let mileage: Int
    private let load: CarAction
    private var trunk: CarAction = .truckLoaded

    init(brand: CarBrand,
         engineType: CarEngine,
         color: String,
         power: Int,
         mileage: Int,
         load: CarAction,
         salePrice: Double,
         carYear: Int)

    {
        self.power = power
        self.mileage = mileage
        self.load = load

        super.init(brand: brand,
                   carYear: 2000,
                   color: color,
                   engineType: engineType,
                   salePrice: salePrice)
    }

    override func actionDone(state: CarAction) {
        trunk = state
        print("\nДвигатель запущен / выключен: \(state)")
    }

    override func displayScoreboard() {
        print("""
        Грузовой автомобиль в продаже:
        Марка: \(brand)
        Год выпуска:\(carYear)
        Тип двигателя: \(engineType)
        Цвет автомобиля: \(color)
        Мощьность: \(power)
        Состояние кузова: \(load)
        Цена: \(salePrice)
        """)
    }
}

//MARK: - OnTheRun

fileprivate let honda = Car(brand: .Honda,
                            carYear: 2009,
                            color: "Серебристый",
                            engineType: .benzine,
                            salePrice: 600000)
honda.displayScoreboard()

fileprivate let ferrari = SportСar(brand: .Ferrari,
                                   engineType: .benzine,
                                   color: "Красный",
                                   power: 700,
                                   mileage: 1000,
                                   driveUnit: "Полный",
                                   salePrice: 12000000,
                                   carYear: 2021,
                                   licensePlate: "В 333 ХХ 77")

ferrari.displayScoreboard()

fileprivate let piterbilt = TrunkCar(brand: .Peterbilt,
                                     engineType: .disel,
                                     color: "Черный",
                                     power: 1200,
                                     mileage: 600000,
                                     load: .truckLoaded,
                                     salePrice: 50000000,
                                     carYear: 2015)

piterbilt.displayScoreboard()
