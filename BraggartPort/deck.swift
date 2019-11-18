//
//  deck.swift
//  BraggartPort
//
//  Created by Murray Butler on 11/11/2019.
//  Copyright © 2019 Haxolotl. All rights reserved.
//

import SpriteKit
import GameplayKit
enum FoeCardType:Int
{
    case trout,
    chicken,
    urchin,
    cat,
    johan,
    lonelyogre,
    bard,
    faeries,
    dwarf,
    forest,
    ghoul,
    carlo,
    wizards,
    highpriest,
    cultists,
    ugkrugglug,
    spirits,
    raiders,
    amazon,
    asssassins,
    magician,
    mercanaris,
    gladiator,
    fellknight,
    sandcreatures,
    undeadking,
    king,
    visitor,
    necromancer,
    queen,
    dragon,
    demon
}
enum DeedCardType:Int
{
    case wetmyself,
    screaming,
    stones,
    killing,
    terror,
    beaten,
    summoned,
    captured,
    pillaged,
    portrait,
    opened,
    sister,
    married,
    wokeup,
    danced,
    overcame,
    heroic,
    defended,
    barfight,
    disguised,
    drunk,
    ambush,
    lovepotion,
    chariot,
    outwitted,
    weapons,
    hat,
    oil,
    uprising,
    princess,
    elements,
    slayer
}
enum SceneCardType:Int
{
    case family,
    maiden,
    spell,
    infiltration,
    bodyguard,
    bedchamber,
    steed,
    sorcery,
    temple,
    bootssmile,
    battlefield,
    warlord,
    frozen,
    citadel
}
enum ResultCardType:Int
{
    case crying,
    smell,
    banned,
    betterperson,
    glow,
    court,
    barmaids,
    knighted,
    deeds,
    painting,
    treasures,
    armies
}
enum NonBoastCardType:Int
{
    case liar,
    outrageousliar,
    triptothebar,
    drunkendemands,
    pickpocket,
    distractingwench
}
class Card : SKSpriteNode
{
    var cardname:String
    var cardsprite:SKTexture
    
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("NSCoding not supported")
    }
    init()
    {
        cardname = "Liar"
        cardsprite = SKTexture(imageNamed: "LiarCard")
    }
    
}
class BoastCard: Card
{
    var boastvalue:Int8
    var finalvalue:Int8
    override init()
    {
        boastvalue = 0
        finalvalue = 0
    }
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("NSCoding not supported")
    }
}
class NonBoastCard: Card
{
    
}
class Deck
{
    
}
