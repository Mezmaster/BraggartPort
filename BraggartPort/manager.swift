//
//  manager.swift
//  BraggartPort
//
//  Created by Murray Butler on 16/12/2019.
//  Copyright © 2019 Haxolotl. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class DraftState : GKState
{
    var scene : GameScene?
    var deck : DeckStack?
    var draft:[Card] = []
    var positions:[CGPoint] = [CGPoint(x: 240, y: 0), CGPoint(x: 80, y:0), CGPoint(x: -80, y:0), CGPoint(x:-240, y:0)]
    var playerpriority: Int;
    var player1label : SKLabelNode!
    var player2label: SKLabelNode!
    var player3label : SKLabelNode!
    var player4label : SKLabelNode!
    var draftphase : SKLabelNode!
    var player1hand : Int
    var player2hand : Int
    var player3hand : Int
    var player4hand : Int
    var player1name : String
    var player2name : String
    var player3name : String
    var player4name : String
    var player1score : Int
    var player2score : Int
    var player3score : Int
    var player4score : Int
    var card1position : CGPoint
    var card2position : CGPoint
    var card3position : CGPoint
    var card4position : CGPoint
    init (scene: GameScene, player1: Player, player2: Player, player3: Player, player4: Player, deck: DeckStack)
    {
        self.scene = scene
        self.deck = deck
        self.player1hand = player1.getHandSize()
        self.player1name = player1.getPlayerName()
        self.player2hand = player2.getHandSize()
        self.player2name = player2.getPlayerName()
        self.player3hand = player3.getHandSize()
        self.player3name = player3.getPlayerName()
        self.player4hand = player4.getHandSize()
        self.player4name = player4.getPlayerName()
        self.player1score = player1.getPlayerScore()
        self.player2score = player2.getPlayerScore()
        self.player3score = player3.getPlayerScore()
        self.player4score = player4.getPlayerScore()
        player1label = SKLabelNode()
        self.player1label.position = CGPoint(x: -250, y: 180)
        self.player1label.zPosition = CGFloat(2)
        self.player1label.text = "\(player1name): \(player1hand) cards (\(player1score))"
        self.player1label.fontColor = UIColor.green
        player2label = SKLabelNode()
        self.player2label.position = CGPoint(x: 250, y: 180)
        self.player2label.zPosition = CGFloat(2)
        self.player2label.text = "\(player2name): \(player2hand) cards (\(player2score))"
        player3label = SKLabelNode()
        self.player3label.position = CGPoint(x: -250, y: -200)
        self.player3label.zPosition = CGFloat(2)
        self.player3label.text = "\(player3name): \(player3hand) cards (\(player3score))"
        player4label = SKLabelNode()
        self.player4label.position = CGPoint(x: 250, y: -200)
        self.player4label.zPosition = CGFloat(2)
        self.player4label.text = "\(player4name): \(player4hand) cards (\(player4score))"
        self.card1position = CGPoint(x: 240, y:0)
        self.card2position = CGPoint(x: 80, y:0)
        self.card3position = CGPoint(x:-80, y:0)
        self.card4position = CGPoint(x: -240, y:0)
        draftphase = SKLabelNode()
        self.draftphase.position = CGPoint(x: 0, y: 120)
        self.draftphase.zPosition = CGFloat(2)
        self.draftphase.text = "Draft Phase"
        self.playerpriority = 1;
        super.init()
    }
    override func didEnter(from previousState: GKState?)
    {
        self.playerpriority = 1;
        scene?.addChild(player1label)
        scene?.addChild(player2label)
        scene?.addChild(player3label)
        scene?.addChild(player4label)
        scene?.addChild(draftphase)
        for _ in 0...3
        {
            let card = deck?.pop()
            draft.append(card!)
            card?.position = CGPoint(x:-480, y:0)
            card?.zPosition = CGFloat(1)
            scene?.addChild(card!)
        }
        for i in 0..<draft.count
        {
            draft[i].run(SKAction.move(to: positions[i], duration: 1.5))
        }
    }
    override func willExit(to nextState: GKState)
    {
        player1label.removeFromParent()
        player2label.removeFromParent()
        player3label.removeFromParent()
        player4label.removeFromParent()
        for i in 0..<draft.count
        {
            draft[i].removeFromParent()
        }
        draftphase.removeFromParent()
        draft.removeAll()
    }
    func changePriority()
    {
        playerpriority += 1
    }
    func getPriority()->Int
    {
        return playerpriority
    }
}
class PlayState1 : GKState
{
    var scene : GameScene?
    var deck : DeckStack?
    var player : Player?
    var handsize : Int?
    var hand:[Card] = []
    var play:[Card] = []
    var handpositions:[CGPoint] = [CGPoint(x: 280, y: -150),
                                   CGPoint(x: 200, y: -150),
                                   CGPoint(x: 120, y: -150),
                                   CGPoint(x: 40, y: -150),
                                   CGPoint(x: -40, y: -150),
                                   CGPoint(x: -120, y: -150),
                                   CGPoint(x:-200, y: -150),
                                   CGPoint(x: -280, y: -150)]
    var positions:[CGPoint] = [CGPoint(x: 240, y: 0), CGPoint(x: 80, y:0), CGPoint(x: -80, y:0), CGPoint(x:-240, y:0)]
    var playerlabel : SKLabelNode!
    var playername : String
    init (scene: GameScene, player: Player, deck: DeckStack)
    {
        self.scene = scene
        self.player = player
        self.playername = player.getPlayerName()
        playerlabel = SKLabelNode()
        self.playerlabel.position = CGPoint(x: -277, y: 181)
        self.playerlabel.zPosition = CGFloat(2)
        self.playerlabel.text = "\(playername)'s turn"
        super.init()
    }
    override func didEnter(from previousState: GKState?)
    {
        let handsize = player?.getHandSize() as! Int
        scene?.addChild(playerlabel)
        for i in 0..<handsize
        {
            let card = player?.getCard(index: i)
            hand.append(card!)
            card?.position = CGPoint(x: -400, y: -150)
            card?.size = CGSize(width: 60, height: 90)
            card?.zPosition = CGFloat(3)
            scene?.addChild(card!)
        }
        for i in 0..<handsize
        {
            hand[i].run(SKAction.move(to: handpositions[i], duration: 1))
        }
    }
    override func willExit(to nextState: GKState)
    {
        playerlabel.removeFromParent()
        for i in 0..<hand.count
        {
            hand[i].removeFromParent()
        }
        for i in 0..<play.count
        {
            player?.increasePlayerScore(increase: play[i].getFinalValue())
            print(player?.getPlayerScore() as! Int)
            
        }
    }
    func getPlayPosition(index: Int)->CGPoint
    {
        return positions[index - 1]
    }
    func playCard(card: Card)
    {
        play.append(card)
    }
}
class PlayState2 : GKState
{
    var scene : GameScene?
    var deck : DeckStack?
    var player : Player?
    var handsize : Int?
    var hand:[Card] = []
    var play:[Card] = []
    var handpositions:[CGPoint] = [CGPoint(x: 280, y: -150),
                                   CGPoint(x: 200, y: -150),
                                   CGPoint(x: 120, y: -150),
                                   CGPoint(x: 40, y: -150),
                                   CGPoint(x: -40, y: -150),
                                   CGPoint(x: -120, y: -150),
                                   CGPoint(x:-200, y: -150),
                                   CGPoint(x: -280, y: -150)]
    var positions:[CGPoint] = [CGPoint(x: 240, y: 0), CGPoint(x: 80, y:0), CGPoint(x: -80, y:0), CGPoint(x:-240, y:0)]
    var playerlabel : SKLabelNode!
    var playername : String
    init (scene: GameScene, player: Player, deck: DeckStack)
    {
        self.scene = scene
        self.player = player
        self.playername = player.getPlayerName()
        playerlabel = SKLabelNode()
        self.playerlabel.position = CGPoint(x: -277, y: 181)
        self.playerlabel.zPosition = CGFloat(2)
        self.playerlabel.text = "\(playername)'s turn"
        super.init()
    }
    override func didEnter(from previousState: GKState?)
    {
        let handsize = player?.getHandSize() as! Int
        scene?.addChild(playerlabel)
        for i in 0..<handsize
        {
            let card = player?.getCard(index: i)
            hand.append(card!)
            card?.position = CGPoint(x: -400, y: -150)
            card?.size = CGSize(width: 60, height: 90)
            card?.zPosition = CGFloat(3)
            scene?.addChild(card!)
        }
        for i in 0..<handsize
        {
            hand[i].run(SKAction.move(to: handpositions[i], duration: 1))
        }
    }
    override func willExit(to nextState: GKState)
    {
        playerlabel.removeFromParent()
        for i in 0..<hand.count
        {
            hand[i].removeFromParent()
        }
        for i in 0..<play.count
        {
            player?.increasePlayerScore(increase: play[i].getFinalValue())
            print(player?.getPlayerScore() as! Int)
        }
    }
    func getPlayPosition(index: Int)->CGPoint
    {
        return positions[index - 1]
    }
    func playCard(card: Card)
    {
        play.append(card)
    }
}
class PlayState3 : GKState
{
    var scene : GameScene?
    var deck : DeckStack?
    var player : Player?
    var handsize : Int?
    var hand:[Card] = []
    var play:[Card] = []
    var handpositions:[CGPoint] = [CGPoint(x: 280, y: -150),
                                   CGPoint(x: 200, y: -150),
                                   CGPoint(x: 120, y: -150),
                                   CGPoint(x: 40, y: -150),
                                   CGPoint(x: -40, y: -150),
                                   CGPoint(x: -120, y: -150),
                                   CGPoint(x:-200, y: -150),
                                   CGPoint(x: -280, y: -150)]
    var positions:[CGPoint] = [CGPoint(x: 240, y: 0), CGPoint(x: 80, y:0), CGPoint(x: -80, y:0), CGPoint(x:-240, y:0)]
    var playerlabel : SKLabelNode!
    var playername : String
    init (scene: GameScene, player: Player, deck: DeckStack)
    {
        self.scene = scene
        self.player = player
        self.playername = player.getPlayerName()
        playerlabel = SKLabelNode()
        self.playerlabel.position = CGPoint(x: -277, y: 181)
        self.playerlabel.zPosition = CGFloat(2)
        self.playerlabel.text = "\(playername)'s turn"
        super.init()
    }
    override func didEnter(from previousState: GKState?)
    {
        let handsize = player?.getHandSize() as! Int
        scene?.addChild(playerlabel)
        for i in 0..<handsize
        {
            let card = player?.getCard(index: i)
            hand.append(card!)
            card?.position = CGPoint(x: -400, y: -150)
            card?.size = CGSize(width: 60, height: 90)
            card?.zPosition = CGFloat(3)
            scene?.addChild(card!)
        }
        for i in 0..<handsize
        {
            hand[i].run(SKAction.move(to: handpositions[i], duration: 1))
        }

    }
    override func willExit(to nextState: GKState)
    {
        playerlabel.removeFromParent()
        for i in 0..<hand.count
        {
            hand[i].removeFromParent()
        }
        for i in 0..<play.count
        {
            player?.increasePlayerScore(increase: play[i].getFinalValue())
            print(player?.getPlayerScore() as! Int)
        }
    }
    func getPlayPosition(index: Int)->CGPoint
    {
        return positions[index - 1]
    }
    func playCard(card: Card)
    {
        play.append(card)
    }
}
class PlayState4 : GKState
{
    var scene : GameScene?
    var deck : DeckStack?
    var player : Player?
    var handsize : Int?
    var hand:[Card] = []
    var play:[Card] = []
    var handpositions:[CGPoint] = [CGPoint(x: 280, y: -150),
                                   CGPoint(x: 200, y: -150),
                                   CGPoint(x: 120, y: -150),
                                   CGPoint(x: 40, y: -150),
                                   CGPoint(x: -40, y: -150),
                                   CGPoint(x: -120, y: -150),
                                   CGPoint(x:-200, y: -150),
                                   CGPoint(x: -280, y: -150)]
    var positions:[CGPoint] = [CGPoint(x: 240, y: 0), CGPoint(x: 80, y:0), CGPoint(x: -80, y:0), CGPoint(x:-240, y:0)]
    var playerlabel : SKLabelNode!
    var playername : String
    init (scene: GameScene, player: Player, deck: DeckStack)
    {
        self.scene = scene
        self.player = player
        self.playername = player.getPlayerName()
        playerlabel = SKLabelNode()
        self.playerlabel.position = CGPoint(x: -277, y: 181)
        self.playerlabel.zPosition = CGFloat(2)
        self.playerlabel.text = "\(playername)'s turn"
        super.init()
    }
    override func didEnter(from previousState: GKState?)
    {
        let handsize = player?.getHandSize() as! Int
        scene?.addChild(playerlabel)
        for i in 0..<handsize
        {
            let card = player?.getCard(index: i)
            hand.append(card!)
            card?.position = CGPoint(x: -400, y: -150)
            card?.size = CGSize(width: 60, height: 90)
            card?.zPosition = CGFloat(3)
            scene?.addChild(card!)
        }
        for i in 0..<handsize
        {
            hand[i].run(SKAction.move(to: handpositions[i], duration: 1))
        }
    }
    override func willExit(to nextState: GKState)
    {
        playerlabel.removeFromParent()
        for i in 0..<hand.count
        {
            hand[i].removeFromParent()
        }
        for i in 0..<play.count
        {
            player?.increasePlayerScore(increase: play[i].getFinalValue())
            print(player?.getPlayerScore() as! Int)
        }
    }
    func getPlayPosition(index: Int)->CGPoint
    {
        return positions[index - 1]
    }
    func playCard(card: Card)
    {
        play.append(card)
    }
}
