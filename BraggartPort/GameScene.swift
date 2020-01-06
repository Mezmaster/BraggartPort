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
    func WriteToText(playername: String, playerscore: Int)
    {
        let file = "file.txt"
        let text = playername + ": " + String(playerscore)
        if let dir = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        {
            let fileURL = dir.appendingPathComponent(file)
            do
            {
                try text.write(to: fileURL, atomically: false, encoding: .utf8)
            }
            catch {"Error"}
            
            do
            {
                let text2 = try String(contentsOf: fileURL, encoding: .utf8)
                print(text2)
            }
            catch {"Error"}
        }
    }
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
        switch stateMachine.currentState
        {
        case is DraftState:
            if let card = atPoint(pos) as? Card
            {
                switch (stateMachine.currentState as! DraftState).getPriority()
                {
                case 1:
                    card.run(SKAction.move(to: CGPoint(x: -240, y: 320), duration: 1))
                    player1.drawCard(card: card)
                    (stateMachine.currentState as! DraftState).changePriority()
                case 2:
                    card.run(SKAction.move(to: CGPoint(x: 240, y: 320), duration: 1))
                    player2.drawCard(card: card)
                    (stateMachine.currentState as! DraftState).changePriority()
                case 3:
                    card.run(SKAction.move(to: CGPoint(x: -240, y: -320), duration: 1))
                    player3.drawCard(card: card)
                    (stateMachine.currentState as! DraftState).changePriority()
                case 4:
                    card.run(SKAction.move(to: CGPoint(x: 240, y: -320), duration: 1))
                    player4.drawCard(card: card)
                    (stateMachine.currentState as! DraftState).changePriority()
                default:
                    break;
                }
            }
            else if (stateMachine.currentState as! DraftState).getPriority() == 5
            {
                stateMachine.enter(PlayState1.self)
            }
        case is PlayState1:
            if let card = atPoint(pos) as? Card
            {
                switch card.getCardType()
                {
                case 1:
                    card.run(SKAction.move(to: (stateMachine.currentState as! PlayState1).getPlayPosition(index: 4), duration: 1))
                    card.run(SKAction.scale(to: CGSize(width: 120, height: 180), duration: 1))
                    (stateMachine.currentState as! PlayState1).playCard(card: card)
                case 2:
                    card.run(SKAction.move(to: (stateMachine.currentState as! PlayState1).getPlayPosition(index: 3), duration: 1))
                    card.run(SKAction.scale(to: CGSize(width: 120, height: 180), duration: 1))
                    (stateMachine.currentState as! PlayState1).playCard(card: card)
                case 3:
                    card.run(SKAction.move(to: (stateMachine.currentState as! PlayState1).getPlayPosition(index: 2), duration: 1))
                    card.run(SKAction.scale(to: CGSize(width: 120, height: 180), duration: 1))
                    (stateMachine.currentState as! PlayState1).playCard(card: card)
                case 4:
                    card.run(SKAction.move(to: (stateMachine.currentState as! PlayState1).getPlayPosition(index: 1), duration: 1))
                    card.run(SKAction.scale(to: CGSize(width: 120, height: 180), duration: 1))
                    (stateMachine.currentState as! PlayState1).playCard(card: card)
                default:
                    break;
                }
            }
            else if let turnend = atPoint(pos) as? SKLabelNode
            {
                stateMachine.enter(PlayState2.self)
            }
        case is PlayState2:
            if let card = atPoint(pos) as? Card
            {
                switch card.getCardType()
                {
                case 1:
                    card.run(SKAction.move(to: (stateMachine.currentState as! PlayState2).getPlayPosition(index: 4), duration: 1))
                    card.run(SKAction.scale(to: CGSize(width: 120, height: 180), duration: 1))
                case 2:
                    card.run(SKAction.move(to: (stateMachine.currentState as! PlayState2).getPlayPosition(index: 3), duration: 1))
                    card.run(SKAction.scale(to: CGSize(width: 120, height: 180), duration: 1))
                case 3:
                    card.run(SKAction.move(to: (stateMachine.currentState as! PlayState2).getPlayPosition(index: 2), duration: 1))
                    card.run(SKAction.scale(to: CGSize(width: 120, height: 180), duration: 1))
                case 4:
                    card.run(SKAction.move(to: (stateMachine.currentState as! PlayState2).getPlayPosition(index: 1), duration: 1))
                    card.run(SKAction.scale(to: CGSize(width: 120, height: 180), duration: 1))
                default:
                    break;
                }
            }
            else if let turnend = atPoint(pos) as? SKLabelNode
            {
                stateMachine.enter(PlayState3.self)
            }
        case is PlayState3:
            if let card = atPoint(pos) as? Card
            {
                switch card.getCardType()
                {
                case 1:
                    card.run(SKAction.move(to: (stateMachine.currentState as! PlayState3).getPlayPosition(index: 4), duration: 1))
                    card.run(SKAction.scale(to: CGSize(width: 120, height: 180), duration: 1))
                case 2:
                    card.run(SKAction.move(to: (stateMachine.currentState as! PlayState3).getPlayPosition(index: 3), duration: 1))
                    card.run(SKAction.scale(to: CGSize(width: 120, height: 180), duration: 1))
                case 3:
                    card.run(SKAction.move(to: (stateMachine.currentState as! PlayState3).getPlayPosition(index: 2), duration: 1))
                    card.run(SKAction.scale(to: CGSize(width: 120, height: 180), duration: 1))
                case 4:
                    card.run(SKAction.move(to: (stateMachine.currentState as! PlayState3).getPlayPosition(index: 1), duration: 1))
                    card.run(SKAction.scale(to: CGSize(width: 120, height: 180), duration: 1))
                default:
                    break;
                }
            }
            else if let turnend = atPoint(pos) as? SKLabelNode
            {
                stateMachine.enter(PlayState4.self)
            }
        case is PlayState4:
            if let card = atPoint(pos) as? Card
            {
                switch card.getCardType()
                {
                case 1:
                    card.run(SKAction.move(to: (stateMachine.currentState as! PlayState4).getPlayPosition(index: 4), duration: 1))
                    card.run(SKAction.scale(to: CGSize(width: 120, height: 180), duration: 1))
                case 2:
                    card.run(SKAction.move(to: (stateMachine.currentState as! PlayState4).getPlayPosition(index: 3), duration: 1))
                    card.run(SKAction.scale(to: CGSize(width: 120, height: 180), duration: 1))
                case 3:
                    card.run(SKAction.move(to: (stateMachine.currentState as! PlayState4).getPlayPosition(index: 2), duration: 1))
                    card.run(SKAction.scale(to: CGSize(width: 120, height: 180), duration: 1))
                case 4:
                    card.run(SKAction.move(to: (stateMachine.currentState as! PlayState4).getPlayPosition(index: 1), duration: 1))
                    card.run(SKAction.scale(to: CGSize(width: 120, height: 180), duration: 1))
                default:
                    break;
                }
            }
            else if let turnend = atPoint(pos) as? SKLabelNode
            {
                stateMachine.enter(DraftState.self)
            }
        default:
            break;
        }
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
