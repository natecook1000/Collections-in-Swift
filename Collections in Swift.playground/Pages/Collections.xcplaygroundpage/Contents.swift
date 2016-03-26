//: # Collections
// MultiplesCollection
struct MultiplesCollection: CollectionType {
    let multiple: Int
    let max: Int
    
    var startIndex: Int { return 0 }
    var endIndex: Int { return max / multiple }
    
    subscript(index: Int) -> Int {
        assert(index >= startIndex && index < endIndex, "Index out of bounds!")
        let result = (index + 1) * multiple
        return result
    }
}

let lotsOfFives = MultiplesCollection(multiple: 5, max: 100)
lotsOfFives[7]

lotsOfFives.count

lotsOfFives.isEmpty


//: ## Iteration
for number in lotsOfFives {
    number
}

let fivesArray = Array(lotsOfFives)


//: ## Finding elements

if let i = lotsOfFives.indexOf(30) {
    print("Found thirty!")
} else {
    print("Not found")
}

if let i = lotsOfFives.indexOf({ $0 % 3 == 0 }) {
    print("Found a multiple of three: \(lotsOfFives[i])")
}

//: ## Indices
//: You rarely need to do this
for i in lotsOfFives.indices {
    lotsOfFives[i]
}


