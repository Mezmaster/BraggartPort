//
//  player.swift
//  BraggartPort
//
//  Created by Murray Butler on 11/11/2019.
//  Copyright © 2019 Haxolotl. All rights reserved.
//

import SpriteKit
import GameplayKit

class Player
{
    var playername:String
    var playerscore:Int
    var playerhand:[Card]
    init ()
    {
        self.playerscore = 0;
        self.playername = "FantasyName";
        self.playerhand = []
    }
    func increasePlayerScore(increase:Int)
    {
        playerscore += increase;
    }
    func getPlayerScore()->Int
    {
        return playerscore
    }
    func drawCard(card:Card)
    {
        playerhand.append(card)
        print(playerhand.count)
    }
}
class HumanPlayer: Player
{
    
}
class AIPlayer: Player
{
    
}
