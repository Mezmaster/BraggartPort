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
    var playernames:[String] = ["Jaxa", "Tyne", "Mori", "Liliana", "Chandra", "Jace", "Gideon", "Lucien", "Jasper",
    "Rosalia", "Marie", "Joel", "Yavvum", "Teka", "Cronos", "Kratos", "Geralt", "Alistair", "Ulfric", "Wulfric",
    "Miku", "Luka", "Rin", "Garrosh", "Xanathar", "Bolas", "Ophelia", "Courtney", "Jester", "Fjord", "Alduin",
    "Jaune", "Ruby", "Yang", "Blake", "Weiss", "Nora", "Ren", "Morrigan", "Ciri", "Charlotte", "Albert", "Olie",
    "Jordan", "Calcifer", "Matt", "Nate", "Rhys", "Carlo", "Hannah", "Kim", "Tim", "Ashiok", "Garruk", "Link", "Lonk",
    "Zelda", "Zoldo"]
    var playername:String
    var playerscore:Int
    var playerhand:[Card]
    init ()
    {
        let randomSource = GKMersenneTwisterRandomSource()
        let nameindex = randomSource.nextInt(upperBound: playernames.count)
        self.playerscore = 0;
        self.playername = playernames[nameindex]
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
    func getPlayerName()->String
    {
        return playername
    }
    func getHandSize()->Int
    {
        return playerhand.count
    }
    func drawCard(card:Card)
    {
        playerhand.append(card)
    }
    func displayCard(index: Int)->Card
    {
        return playerhand[index]
    }
}
class HumanPlayer: Player
{
    
}
class AIPlayer: Player
{
    
}
