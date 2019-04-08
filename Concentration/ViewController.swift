//
//  ViewController.swift
//  Concentration
//
//  Created by 임성주 on 01/04/2019.
//  Copyright © 2019 jangre. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    lazy var game: Concentration = Concentration(numberOfPairOfCards: (cardButtons.count + 1) / 2)
    var flipCount: Int = 0
    var emojiChoices = ["🦇","🤗","🙀","😈","👻","🎃","🍭","🍬","🍎"]
    var emoji = [Int:String]()
    
    @IBOutlet weak var flipCountLabel: UILabel!
    @IBOutlet var cardButtons: [UIButton]!
    
    @IBAction func touchCard(_ sender: UIButton) {
        if let cardNumber = cardButtons.firstIndex(of: sender) {
            game.chooseCard(at: cardNumber)
            updateViewFromModel()
        }
        self.flipCount += 1
        self.flipCountLabel.text = "Flips: \(flipCount)"
    }
    
    func updateViewFromModel() {
        for index in cardButtons.indices {
            let button = cardButtons[index]
            let card = game.cards[index]
            if card.isFaceUp {
                button.setTitle(emoji(for: card), for: .normal)
                button.backgroundColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
            } else {
                button.setTitle("", for: .normal)
                button.backgroundColor = card.isMatched ? #colorLiteral(red: 1, green: 0.7086189389, blue: 0, alpha: 0) : #colorLiteral(red: 1, green: 0.7086189389, blue: 0, alpha: 1)
            }
        }
    }
    
    func emoji(for card: Card) -> String {
        if emoji[card.identifier] == nil, emojiChoices.count > 0 {
                let randomIndex = Int(arc4random_uniform(UInt32(emojiChoices.count)))
                emoji[card.identifier] = emojiChoices.remove(at: randomIndex)
        }
        return emoji[card.identifier] ?? "?"
    }
}
