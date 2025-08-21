//
//  DiceFace.swift
//  Dicee-iOS13
//
//  Created by itsector on 20/08/2025.
//  Copyright © 2025 London App Brewery. All rights reserved.


import UIKit


// O caseIterable permite que você pegue todas as opções como uma lista (ótimo para sortear).
enum DiceFace: String, CaseIterable {
    case one = "DiceOne"
    case two = "DiceTwo"
    case three = "DiceThree"
    case four = "DiceFour"
    case five = "DiceFive"
    case six = "DiceSix"
    
    //self → é o valor atual do enum (.one, .two etc).
    //rawValue → pega o texto associado (ex.: "diceOne").
    var image: UIImage? {
            // Tenta pegar a imagem do Assets
            // Se não existir, usa uma imagem genérica do sistema ("questionmark.square")
            UIImage(named: self.rawValue) ?? UIImage(systemName: "questionmark.square")
        }
    
    var value: Int {
                switch self {
                case .one: return 1
                case .two: return 2
                case .three: return 3
                case .four: return 4
                case .five: return 5
                case .six: return 6
                }
            }
        
    
    static func random() -> DiceFace {
        return DiceFace.allCases.randomElement()!
    }
}
