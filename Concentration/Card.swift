//
//  Card.swift
//  Concentration
//
//  Created by 임성주 on 01/04/2019.
//  Copyright © 2019 jangre. All rights reserved.
//

import Foundation

struct Card: Hashable {
    static func ==(lhs: Card, rhs: Card) -> Bool {
        return lhs.identifier == rhs.identifier
    }
    
    var isFaceUp = false
    var isMatched = false
    private var identifier: Int
    
    private static var identifierFactory = 0
    
    private static func getUniqeIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqeIdentifier()
    }
}

