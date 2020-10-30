//1. Создайте перечисление для ошибок. Добавьте в него 3 кейса:
//
//ошибка 400,
//ошибка 404,
//ошибка 500.
//Далее создайте переменную, которая будет хранить в себе какую-либо ошибку (400 или 404 или 500). И при помощи do-catch сделайте обработку ошибок перечисления. Для каждой ошибки должно быть выведено сообщение в консоль.


//2. Теперь добавьте проверку переменных в генерирующую функцию и обрабатывайте её!


//3. Напишите функцию, которая будет принимать на вход два разных типа и проверять: если типы входных значений одинаковые, то вывести сообщение “Yes”, в противном случае — “No”.


//4. Реализуйте то же самое, но если тип входных значений различается, выбросите исключение. Если тип одинаковый — тоже выбросите исключение, но оно уже будет говорить о том, что типы одинаковые. Не бойтесь этого. Ошибки — это не всегда про плохой результат.


//5. Напишите функцию, которая принимает на вход два любых значения и сравнивает их при помощи оператора равенства ==.


// 1, 2 //
enum http: Error {
    case error400
    case error404
    case error500
}

var error400: Bool = false
var error404: Bool = true
var error500: Bool = false

func httpError() throws {
    if error400 {
         throw http.error400
     }
     if error404 {
         throw http.error404
     }
     if error500 {
         throw http.error500
     }
}

do {
    try httpError()
} catch http.error400 {
    print("Ошибка 400")
} catch http.error404 {
    print("Ошибка 404")
} catch http.error500 {
    print("Ошибка 500")
}

// 3 //
func someFunc <T, E> (a: T, b: E) {
    if T.self == E.self {
        print("YEP")
    }
    if T.self != E.self {
        print("NOPE")
    }
}

someFunc(a: "4.3", b: "5.5")


// 4 //
enum funcError: Error {
    case equal
    case unequal
}

func anotherFunc <T, E> (a: T, b: E) throws {
    if T.self == E.self {
        throw funcError.equal
    }
    if T.self != E.self {
        throw funcError.unequal
    }
}

do {
    try anotherFunc(a: 4.3, b: 5)
} catch funcError.equal {
    print("It is equal")
} catch funcError.unequal {
    print("It is unequal")
}

// 5 //
func equalFunc <T: Equatable> (a: T, b: T) {
    if a == b {
        print("It is equal")
    } else {
        print("It is not equal")
    }
}
equalFunc(a: 4, b: 4)
