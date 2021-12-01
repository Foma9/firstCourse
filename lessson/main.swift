//
//  main.swift
//  lessson
//
//  Created by Евгений Ефименко on 26.11.2021.
//

import Foundation

// Задание 1
func evenNumber(_ number: Int) -> Bool {
    return number % 2 == 0

}
print(evenNumber(11))

// Задание 2

func numbers(_ number: Int) -> Bool {
    return number % 3 == 0

}
print(numbers(12))

//Задание 3

var list = [Int]()
for numbers in 1...100 {
    list.append(numbers)
}
print("Вывод чисел от 1 до 100: \(list)")

// Задание 4

var delete = list.filter { $0 % 2 != 0 && $0 % 3 == 0 }
print("Не четные числа которые делятся на 3: \(delete)")

// Задание 5

func Fibbonachi(number: Int) {
    var fibbonachiNumbers = [1 , 1]
    (2...number - 1).forEach{ i in
        fibbonachiNumbers.append(fibbonachiNumbers[ i - 1 ] + fibbonachiNumbers[ i - 2 ])
    }
    print("Вывод первых \(number) чисел Фибоначчи: \(fibbonachiNumbers)")
}
Fibbonachi(number: 50)

// Задание 6

func PrimeNumbers(upTo n: Int) -> [Int] {
    var numbers = [Int](2...n)
    for i in 0...n - 2 {
        let prime = numbers[i]
        guard prime > 0 else { continue }

        for multiple in stride(from: prime * prime - 2, through: n - 2, by: prime) {
            numbers[multiple] = 0
        }
    }
    return numbers.filter { $0 > 0 }
}
print(PrimeNumbers(upTo: 100))


