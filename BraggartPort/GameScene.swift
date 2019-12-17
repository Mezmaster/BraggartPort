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
        let text = "Plz work"
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
