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
    var deck = DeckStack()
    override func didMove(to view: SKView)
    {
        /*
        let card1 = Card(index: 0)
        card1.position = CGPoint(x:0, y:0)
        addChild(card1)
        */
        for i in 0...91
        {
            let card = Card(index: i)
            deck.push(card)
        }
    }
    override func sceneDidLoad()
    {
        self.lastUpdateTime = 0
    }
    func touchDown(atPoint pos : CGPoint)
    {
        let card = deck.pop()
        card.position = CGPoint(x:0, y:0)
        addChild(card)
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
            if let card1 = atPoint(location) as? Card
            {
                card1.position = location
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
        
        self.lastUpdateTime = currentTime
    }
}
