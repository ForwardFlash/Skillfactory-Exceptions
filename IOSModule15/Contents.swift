import PlaygroundSupport
import UIKit
import Foundation

// Перечисление для ошибок
enum ErrorList: Error {
    case error400 // "400 Bad Request"
    case error404 // "404 Not Found"
    case error500 // "500 Internal Server Error"
}

// Инициализируем переменные для хранения состояний ошибок
var error400:Bool = false
var error404:Bool = false
var error500:Bool = false

// Генерирующая функция для ошибок
func errorHandler() throws {
    if error400 {throw ErrorList.error400}
    if error404 {throw ErrorList.error404}
    if error500 {throw ErrorList.error500}
}

// Имитируем ошибку для проверки
error404 = true

// Обработка ошибок из перечисления
do {
    try errorHandler()
} catch ErrorList.error400 {
    print("400 Bad Request")
} catch ErrorList.error404 {
    print("404 Not Found")
} catch ErrorList.error500 {
    print ("500 Internal Server Error")
}

//Функция, принимающая на вход два разных типа и проверяющая типы на идентичность с выводом сообщений
func TypesCheck <T: Equatable, E: Equatable> (value1: T, value2: E) -> Bool {
    if type(of: value1) == type(of: value2) {
        print ("Yes")
        return true
    } else {
        print ("No")
        return false
    }
}

// Проверка работы функции
TypesCheck(value1: 10, value2: "Текстовые данные")
TypesCheck(value1: 10.2, value2: 123.4)

// Перечисление для вывода исключений после проверки типов
enum TypesComparingResult: Error {
    case typesEqual
    case typesNotEqual
}

// Функция сравнения типов с выбросом исключения
func TypesCheckThrows<T: Equatable, E: Equatable>(value1: T, value2: E) throws {
    if type(of: value1) == type(of: value2) {
        throw TypesComparingResult.typesEqual
    }
    else {
        throw TypesComparingResult.typesNotEqual
    }
}

// Обработка исключений при сравнении
do {
    try TypesCheckThrows(value1: "Шило", value2: "Мыло")
}
catch TypesComparingResult.typesEqual {
    print("Yes")
}
catch TypesComparingResult.typesNotEqual {
    print("No")
}

// Функция сравнения значений с проверкой типов
func ValuesCompare <T: Equatable, E: Equatable> (firstValue: T, secondValue: E) {
    // проверяем типы, используя функцию
    if TypesCheck(value1: firstValue, value2: secondValue) {
        // пытаемся привести второе значение к типу первого
        // без этого не компилируется строка сравнения
        let secondValue = secondValue as! T
        if firstValue == secondValue {
            print("Значения равны")
        } else {print("Значения отличаются")}
    } else {print("Типы отличаются, значения не могут быть сверены")}
}

// Проверка работы функции
ValuesCompare(firstValue: true, secondValue: true)
// при проверке вместе с результатом сравнения значений выводится результат сравнения типов
ValuesCompare(firstValue: 2, secondValue: true)
