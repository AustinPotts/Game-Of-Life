//
//  Cell.swift
//  Game-Of-Life-iOS
//
//  Created by Austin Potts on 6/24/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import Foundation

// Current state the Cell is in
enum State {
    case alive, dead
}

// Need a Hashable Cell in order to get integer hash value
struct Cell: Hashable {
    // The Cell will contain an X position, Y position & Current State(alive or dead)
    let x: Int
    let y: Int
    var state: State
    
    init(x: Int, y: Int, state: State) {
        self.x = x
        self.y = y
        self.state = state
    }
    
    // Generating own hash
    // Hasher struct uses a random seed to generate its hash values, which means that a given object’s hash value will change between runs of your program.
    // On average, the time complexity of the search function with the use of hashing is O(1)
    func hash(into hasher: inout Hasher) {
        let hash = x + y * 1_0000
        hasher.combine(hash)
    }
    
    // Find out if the Cell has a neighbor
    func isCellNeighbor(to cell: Cell) -> Bool {
        let xDiff = abs(self.x - cell.x)
        let yDiff = abs(self.y - cell.y)
        
        switch (xDiff, yDiff) {
        case (1, 1), (0, 1), (1, 0):
            return true
        default:
            return false
        }
    }
    
    // Toggle the state of the Cell (Alive, Dead)
    mutating func toggle() {
        switch state {
        case .alive:
            self.state = .dead
        case .dead:
            self.state = .alive
        }
    }
}
