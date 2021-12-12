//
//  main.swift
//  less6
//
//  Created by Евгений Ефименко on 12.12.2021.
//

import Foundation

//MARK: - Stuct Jurnal Auto

struct JurnalAuto {
    var model: String
    var nomer: Int
}

extension JurnalAuto: CustomStringConvertible {
    var description: String {
        return "Модель: \(model), Номер: \(nomer)"
    }
}

//MARK: - Stuct Queue Auto

struct QueueAuto <T> {
    private var elements: [T] = []

    public var isCarWash: Bool {
        return elements.count == 0
    }

    mutating func toQueued(element: T) {
        elements.append(element)
    }

    mutating func deleteLast() -> T {
        return elements.removeLast()
    }

    public var firstToCarWas: T? {
        if isCarWash {
            print("No one is in the queue")
            return nil
        } else {
            print("The first in front \(String(describing: elements.first))")
            return elements.first
        }
    }
    public var lastToCarWash: T? {
        if isCarWash {
            print("No one is in the queue")
            return nil
        } else {
            print("The last in line \(String(describing: elements.last))")
            return elements.last
        }
    }

    func printQueue() {
        print(elements)
    }

    subscript(index: Int) -> T? {
        return(index >= 0 && index < elements.count) ? elements[index] : nil
    }
}

extension QueueAuto {
    func myFilter(predicate:(T) -> Bool) -> [T] {
        var result = [T]()
        for i in elements {
            if predicate(i) {
                result.append(i)
            }
        }
        return result
    }
}

//MARK: - Operations

var auto = QueueAuto<JurnalAuto>()
auto.toQueued(element: .init(model: "Ока", nomer: 333))
auto.toQueued(element: .init(model: "Волга", nomer: 777))
auto.toQueued(element: .init(model: "Газель", nomer: 555))

auto.printQueue()



