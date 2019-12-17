//
//  GameScene.swift
//  BraggartPort
//
//  Created by Murray Butler on 28/10/2019.
//  Copyright © 2019 Haxolotl. All rights reserved.
//

import SpriteKit
import GameplayKit
struct DeckStack
{
    private var deck:[Card] = []
    func peek()->Card
    {
        guard let topCard = deck.first else {fatalError("Deck is empty")}
        return topCard
    }
    mutating func pop()->Card
    {
        return deck.removeFirst()
    }
    mutating func push(_ card:Card)
    {
        deck.insert(card, at: 0)
    }
    var isEmpty: Bool
    {
        return deck.isEmpty
    }
    var count: Int
    {
        return deck.count
    }
}
class DraftState : GKState
{
    var scene : GameScene?
    var deck : DeckStack?
    var draft:[Card] = []
    var positions:[CGPoint] = [CGPoint(x: 240, y: 0), CGPoint(x: 80, y:0), CGPoint(x: -80, y:0), CGPoint(x:-240, y:0)]
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
        self.card1position = CGPoint(x: 240, y:0)
        self.card2position = CGPoint(x: 80, y:0)
        self.card3position = CGPoint(x:-80, y:0)
        self.card4position = CGPoint(x: -240, y:0)
        draftphase = SKLabelNode()
        self.draftphase.position = CGPoint(x: 0, y: 120)
        self.draftphase.zPosition = CGFloat(2)
        self.draftphase.text = "Draft Phase"
        super.init()
    }
    override func didEnter(from previousState: GKState?)
    {
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
            draft[i].run(SKAction.move(to: positions[i], duration: 3))
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
    }
}
class PlayState1 : GKState
{
    var scene : GameScene?
    var deck : DeckStack?
    var player : Player?
    var handsize : Int?
    var handpositions:[CGPoint] = [CGPoint(x: 280, y: -150),
                                   CGPoint(x: 200, y: -150),
                                   CGPoint(x: 120, y: -150),
                                   CGPoint(x: 40, y: -150),
                                   CGPoint(x: -40, y: -150),
                                   CGPoint(x: -120, y: -150),
                                   CGPoint(x:-200, y: -150),
                                   CGPoint(x: -280, y: -150)]
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
            let card = player?.displayCard(index: i)
        }
    }
    override func willExit(to nextState: GKState)
    {
        playerlabel.removeFromParent()
    }
}
class PlayState2 : GKState
{
    var scene : GameScene?
    var deck : DeckStack?
    var playerlabel : SKLabelNode!
    var playername : String
    init (scene: GameScene, player: Player, deck: DeckStack)
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
    var deck : DeckStack?
    var playerlabel : SKLabelNode!
    var playername : String
    init (scene: GameScene, player: Player, deck: DeckStack)
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
    var deck : DeckStack?
    var playerlabel : SKLabelNode!
    var playername : String
    init (scene: GameScene, player: Player, deck: DeckStack)
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
class GameScene: SKScene
{
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    private var lastUpdateTime : TimeInterval = 0
    var stateMachine: GKStateMachine!
    var deck = DeckStack()
    var player1 = Player()
    var player2 = Player()
    var player3 = Player()
    var player4 = Player()
    override func didMove(to view: SKView)
    {
        var initialcards:[Card] = []
        for i in 0...91
        {
            let card = Card(index: i)
            initialcards.append(card)
        }
        let shuffledcards:[Card] = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: initialcards) as! [Card]
        for i in 0..<shuffledcards.count
        {
            deck.push(shuffledcards[i])
        }
        for _ in 0...4
        {
            player1.drawCard(card: deck.pop())
            player2.drawCard(card: deck.pop())
            player3.drawCard(card: deck.pop())
            player4.drawCard(card: deck.pop())
        }
        self.stateMachine = GKStateMachine(states: [DraftState(scene: self, player1: player1, player2: player2, player3: player3, player4: player4, deck: deck),
                                                    PlayState1(scene:self, player: player1, deck: deck),
                                                    PlayState2(scene: self, player: player2, deck: deck),
                                                    PlayState3(scene: self, player: player3, deck: deck),
                                                    PlayState4(scene: self, player: player4, deck: deck)])
        self.stateMachine.enter(DraftState.self)
    }
    override func sceneDidLoad()
    {
        self.lastUpdateTime = 0
    }
    func touchDown(atPoint pos : CGPoint)
    {
        
    }
    func touchMoved(toPoint pos : CGPoint)
    {
        
    }
    func touchUp(atPoint pos : CGPoint)
    {

    }
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches
        {
            self.touchDown(atPoint: t.location(in: self))
        }
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches
        {
            let location = t.location(in: self)
            if let card = atPoint(location) as? Card
            {
                card.position = location
            }
        }
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?)
    {
        for t in touches { self.touchUp(atPoint: t.location(in: self)) }
    }
    override func update(_ currentTime: TimeInterval)
    {
        // Called before each frame is rendered
        
        // Initialize _lastUpdateTime if it has not already been
        if (self.lastUpdateTime == 0)
        {
            self.lastUpdateTime = currentTime
        }
        
        // Calculate time since last update
        let dt = currentTime - self.lastUpdateTime
        
        // Update entities
        for entity in self.entities
        {
            entity.update(deltaTime: dt)
        }
        self.stateMachine.update(deltaTime: currentTime)
        self.lastUpdateTime = currentTime
    }
}
