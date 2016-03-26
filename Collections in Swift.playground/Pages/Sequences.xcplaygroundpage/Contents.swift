//: # Sequences
// Multiples
struct Multiples: SequenceType {
    let multiple: Int
    let max: Int
    
    // generator()
    func generate() -> MultiplesGenerator {
        return MultiplesGenerator(self)
    }
}

// MultiplesGenerator
struct MultiplesGenerator: GeneratorType {
    let multiples: Multiples
    var current = 0
    
    init(_ multiples: Multiples) {
        self.multiples = multiples
    }
    
    // next()
    mutating func next() -> Int? {
        current += multiples.multiple
        if current > multiples.max {
            return nil
        }
        return current
    }
}

let lotsOfFives = Multiples(multiple: 5, max: 100)

//: ## Iteration
for number in lotsOfFives {
    number
}

let fivesArray = Array(lotsOfFives)

//: ## Finding Elements
lotsOfFives.contains(15)

lotsOfFives.contains(19)

lotsOfFives.minElement()

lotsOfFives.maxElement()

//: ## Subsequences

let subsequence = lotsOfFives.dropFirst(3)
for number in subsequence {
    number
}

let subsubsequence = lotsOfFives.dropFirst(3).prefix(5)
for number in subsubsequence {
    number
}


//: ## Functional Methods

let tripledFives = lotsOfFives.map { $0 * 3 }
for number in tripledFives {
    number
}


let oddMultiples = lotsOfFives.filter { $0 % 2 != 0 }
for number in oddMultiples {
    number
}

//: ## Permutations

let reversed = lotsOfFives.reverse()
for number in reversed {
    number
}


let unreversed = reversed.sort()
for number in unreversed {
    number
}

