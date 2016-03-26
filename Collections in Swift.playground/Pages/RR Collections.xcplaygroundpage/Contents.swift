//: # Range-Replaceable Collections

var numbers = [10, 20, 30, 40, 50, 60]

numbers.append(100)

numbers.insert(200, atIndex: 0)

numbers.removeFirst(3)

numbers.insertContentsOf(1...5, at: 3)

numbers.insertContentsOf(numbers, at: 2)


//: ## Back to the “problem”

numbers = [10, 20, 30, 40, 50, 60, 70, 80, 90]

let firstFive = numbers.prefix(5)
firstFive.dynamicType

let reversedNumbers = numbers.reverse()


//: ## New approaches
//: We now have three variables with three different types:
numbers             // [Int]
firstFive           // ArraySlice<Int>
reversedNumbers     // ReverseRandomAccessCollection<[Int]>

//: ### How can we write a function that works with any of these?
//: Easy!
func sumArray(values: [Int]) -> Int {
    var sum = 0
    for value in values {
        sum += value
    }
    return sum
}

sumArray(numbers)
sumArray(Array(firstFive))
sumArray(Array(reversedNumbers))

//: ## 🚫 Nope
//:
//: Converting back to `Array` *copies* the elements from `numbers` into a new array. This is unnecessary and inefficient—we can do better!
//:
//: ### How can we write a function that works with any of these *without converting back to an array?*

func sumSequence<S: SequenceType where
    S.Generator.Element == Int>(values: S) -> Int
{
    var sum = 0
    for value in values {
        sum += value
    }
    return sum
}

sumSequence(numbers)
sumSequence(firstFive)
sumSequence(reversedNumbers)


//: ### How can we write a *method* that works with any of these?

extension SequenceType where Generator.Element == Int {
    
    func sum() -> Int {
        var result = 0
        for value in self {
            result += value
        }
        return result
    }
    
}

numbers.sum()
firstFive.sum()
reversedNumbers.sum()

