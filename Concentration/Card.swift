//
//  Card.swift
//  Concentration
//
//  Created by 임성주 on 01/04/2019.
//  Copyright © 2019 jangre. All rights reserved.
//

import Foundation

struct Card {
    var isFaceUp = false
    var isMatched = false
    var identifier: Int
    
    static var identifierFactory = 0
    
    static func getUniqeIdentifier() -> Int {
        identifierFactory += 1
        return identifierFactory
    }
    
    init() {
        self.identifier = Card.getUniqeIdentifier()
    }
}
