//
//  ViewController.swift
//  TicTacToe
//
//  Created by 陳囿豪 on 2016/12/22.
//  Copyright © 2016年 yasuoyuhao. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var activeGame = true
    var activePlayer = 1
    var gameState = [Int](repeating :0 , count:9)
    let winningCombinations = [[1,4,7],[2,4,6],[2,5,8],[3,4,5],[6,7,8],[0,1,2],[0,4,8],[0,3,6]]
    
    @IBOutlet var messageLabel: UILabel!
    @IBOutlet var againButton: UIButton!

    @IBAction func buttonAgainPress(_ sender: Any) {
        activeGame = true
        activePlayer = 1
            buttonReset()
            buttonandlabelisHiddentrue()
            animateShowDown()
        }
    
    
    @IBAction func buttonPressed(_ sender: UIButton) {
        let activePostion = sender.tag - 1
        
        if gameState[activePostion] == 0 && activeGame {
            gameState[activePostion] = activePlayer
            
            if activePlayer == 1 {
                sender.setImage(UIImage(named: "nought.png"), for: [])
                activePlayer = 2
            }else{
                sender.setImage(UIImage(named: "cross.png"), for: [])
                activePlayer = 1
            }
        }
        
        
        for combination in winningCombinations {
            let theWinGame = gameState[combination[0]] != 0 && gameState[combination[0]] == gameState[combination[1]] && gameState[combination[1]] == gameState[combination[2]]
            let tieStatus = !gameState.contains(0) && !theWinGame
            if theWinGame {
                endgame()
                if gameState[combination[0]] == 1{
                    messageLabel.text = "⭕️贏了"
                }else{
                    messageLabel.text = "❌贏了"
                }
                animateShow()
            }else if tieStatus{
                endgame()
                messageLabel.text = "平手"
                animateShow()
            }
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        buttonandlabelisHiddentrue()
        animateShowDown()
        buttonReset()
    }
    
    



    func buttonReset(){
        for i in 0...8{
        gameState[i] = 0
            if let button = view.viewWithTag(i+1) as? UIButton{
                button.setImage((nil), for: [])
                button.isEnabled = true
            }
        }
    }
    func endgame(){
        activeGame = false
        messageLabel.isHidden = false
        againButton.isHidden = false
        for i in 0...8 {
            if let button = view.viewWithTag(i+1) as? UIButton{
                button.isEnabled = false
            }
        }
    }
    
    
    func buttonandlabelisHiddentrue(){
        messageLabel.isHidden = true
        againButton.isHidden = true
    }
    
    
    func animateShow(){
        UIView.animate(withDuration: 1, animations: {
            self.messageLabel.center = CGPoint(x :self.messageLabel.center.x + 500 ,y :self.messageLabel.center.y)
            self.againButton.center = CGPoint(x :self.againButton.center.x + 500 ,y :self.againButton.center.y)
        })
    }
    
    
    func animateShowDown() {
        messageLabel.center = CGPoint(x :self.messageLabel.center.x - 500 ,y :self.messageLabel.center.y)
        againButton.center = CGPoint(x :self.againButton.center.x - 500 ,y :self.againButton.center.y)
    }
    
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

