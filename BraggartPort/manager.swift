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
/*
class DraftState : GKState
{
    var scene : GameScene?
    var player1label : SKLabelNode!
    var player2label: SKLabelNode!
    var player3label : SKLabelNode!
    var player4label : SKLabelNode!
    //var draftphase : SKLabelNode
    var player1hand : Int
    var player2hand : Int
    var player3hand : Int
    var player4hand : Int
    var player1name : String
    var player2name : String
    var player3name : String
    var player4name : String
    init (scene: GameScene, player1: Player, player2: Player, player3: Player, player4: Player)
    {
        self.scene = scene
        self.player1hand = player1.getHandSize()
        self.player1name = player1.getPlayerName()
        self.player2hand = player2.getHandSize()
        self.player2name = player2.getPlayerName()
        self.player3hand = player3.getHandSize()
        self.player3name = player3.getPlayerName()
        self.player4hand = player4.getHandSize()
        self.player4name = player4.getPlayerName()
        player1label = SKLabelNode()
        self.player1label.position = CGPoint(x: -250, y: 180)
        self.player1label.zPosition = CGFloat(2)
        self.player1label.text = "\(player1name): \(player1hand) cards"
        player2label = SKLabelNode()
        self.player2label.position = CGPoint(x: 250, y: 180)
        self.player2label.zPosition = CGFloat(2)
        self.player2label.text = "\(player2name): \(player2hand) cards"
        player3label = SKLabelNode()
        self.player3label.position = CGPoint(x: -250, y: -200)
        self.player3label.zPosition = CGFloat(2)
        self.player3label.text = "\(player3name): \(player3hand) cards"
        player4label = SKLabelNode()
        self.player4label.position = CGPoint(x: 250, y: -200)
        self.player4label.zPosition = CGFloat(2)
        self.player4label.text = "\(player4name): \(player4hand) cards"
        super.init()
    }
    override func didEnter(from previousState: GKState?)
    {
        scene?.addChild(player1label)
        scene?.addChild(player2label)
        scene?.addChild(player3label)
        scene?.addChild(player4label)
    }
    override func willExit(to nextState: GKState)
    {
        player1label.removeFromParent()
        player2label.removeFromParent()
        player3label.removeFromParent()
        player4label.removeFromParent()
    }
}
class PlayState1 : GKState
{
    var scene : GameScene?
    var playerlabel : SKLabelNode!
    var playername : String
    init (scene: GameScene, player: Player)
    {
        self.scene = scene
        self.playername = player.getPlayerName()
        playerlabel = SKLabelNode()
        self.playerlabel.position = CGPoint(x: -277, y: 181)
        self.playerlabel.zPosition = CGFloat(2)
        self.playerlabel.text = "\(playername)'s turn"
        super.init()
    }
    override func didEnter(from previousState: GKState?)
    {
        scene?.addChild(playerlabel)
    }
    override func willExit(to nextState: GKState)
    {
        playerlabel.removeFromParent()
    }
}
class PlayState2 : GKState
{
    var scene : GameScene?
    var playerlabel : SKLabelNode!
    var playername : String
    init (scene: GameScene, player: Player)
    {
        self.scene = scene
        self.playername = player.getPlayerName()
        playerlabel = SKLabelNode()
        self.playerlabel.position = CGPoint(x: -277, y: 181)
        self.playerlabel.zPosition = CGFloat(2)
        self.playerlabel.text = "\(playername)'s turn"
        super.init()
    }
    override func didEnter(from previousState: GKState?)
    {
        scene?.addChild(playerlabel)
    }
    override func willExit(to nextState: GKState)
    {
        playerlabel.removeFromParent()
    }
}
class PlayState3 : GKState
{
    var scene : GameScene?
    var playerlabel : SKLabelNode!
    var playername : String
    init (scene: GameScene, player: Player)
    {
        self.scene = scene
        self.playername = player.getPlayerName()
        playerlabel = SKLabelNode()
        self.playerlabel.position = CGPoint(x: -277, y: 181)
        self.playerlabel.zPosition = CGFloat(2)
        self.playerlabel.text = "\(playername)'s turn"
        super.init()
    }
    override func didEnter(from previousState: GKState?)
    {
        scene?.addChild(playerlabel)
    }
    override func willExit(to nextState: GKState)
    {
        playerlabel.removeFromParent()
    }
}
class PlayState4 : GKState
{
    var scene : GameScene?
    var playerlabel : SKLabelNode!
    var playername : String
    init (scene: GameScene, player: Player)
    {
        self.scene = scene
        self.playername = player.getPlayerName()
        playerlabel = SKLabelNode()
        self.playerlabel.position = CGPoint(x: -277, y: 181)
        self.playerlabel.zPosition = CGFloat(2)
        self.playerlabel.text = "\(playername)'s turn"
        super.init()
    }
    override func didEnter(from previousState: GKState?)
    {
        scene?.addChild(playerlabel)
    }
    override func willExit(to nextState: GKState)
    {
        playerlabel.removeFromParent()
    }
}
*/
