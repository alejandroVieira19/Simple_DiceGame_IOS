//
//  ViewController.swift
//  Dicee-iOS13
//
//  Created by Angela Yu on 11/06/2019.
//  Copyright © 2019 London App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    //IBOutlet permite-me fazer referência ao elemento UI
    @IBOutlet weak var diceImageviewOne: UIImageView!
    
    @IBOutlet weak var diceImageViewTwo: UIImageView!
    
    @IBOutlet weak var diceOneResult: UILabel!
    
    @IBOutlet weak var diceTwoResult: UILabel!
    
    @IBOutlet weak var hiddenWinnerMessage: UILabel!
    
    @IBOutlet weak var diceOneText: UILabel!
    
    @IBOutlet weak var diceTwoText: UILabel!
    
    // MARK: - Variáveis de pontuação
        var diceOneScore: Int = 0 {
            didSet {
                diceOneResult.text = "\(diceOneScore)"
            }
        }

        var diceTwoScore: Int = 0 {
            didSet {
                diceTwoResult.text = "\(diceTwoScore)"
            }
        }
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
    }
    
    //@IBAction → indica que essa função é conectada a um botão no Storyboard.
    
    //rollBtnClicked → nome da função que será executada quando o botão for clicado.

    //sender: UIButton → o próprio botão que foi clicado (não é obrigatório usar, mas pode ser útil).
    
    @IBAction func rollBtnClicked(_ sender: UIButton) {
        
        let diceOneValue = DiceFace.random()
        
        let diceTwoValue = DiceFace.random()
        
        updateDiceImage(diceOneImage: diceOneValue.image,
                        diceTwoImage: diceTwoValue.image)
        
        calculateDiceWinner(diceOneValue: diceOneValue.value,                    diceTwoValue : diceTwoValue.value)
    }
    
    
    @IBAction func resetBtnClicked(_ sender: Any) {
        resetDiceGame()
    }
    
    func resetDiceGame() {
        
        hiddenWinnerMessage.isHidden = true
        
        diceOneScore = 0
        
        diceTwoScore = 0
    }
    
    
    
    func updateDiceImage(diceOneImage: UIImage?,
                         diceTwoImage: UIImage?) {
        
        //WHO           //WHAT   // Value
        diceImageviewOne.image = diceOneImage
        
        diceImageViewTwo.image = diceTwoImage
    }
    
    func calculateDiceWinner(diceOneValue: Int, diceTwoValue: Int) {
        
        if diceOneValue > diceTwoValue {
            diceOneScore += 1
            showWinnerHiddenMessage(diceOneText.text! + " won!")
            
        } else if diceTwoValue > diceOneValue {
            diceTwoScore += 1
            showWinnerHiddenMessage(diceTwoText.text! + " won!")
        } else {
            showWinnerHiddenMessage("Draw!")
        }
        }
    
    func showWinnerHiddenMessage(_ winner : String) {
        
        hiddenWinnerMessage.text = winner
        
        hiddenWinnerMessage.isHidden = false
    }
    
    // O Main é também conhecido como interface Builder.
    
}

