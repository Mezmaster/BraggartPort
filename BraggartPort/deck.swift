//
//  deck.swift
//  BraggartPort
//
//  Created by Murray Butler on 11/11/2019.
//  Copyright © 2019 Haxolotl. All rights reserved.
//

import SpriteKit
import GameplayKit
enum BaseCardType:Int
{
    case foe,
    deed,
    scene,
    result,
    nonboast
}
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
    let cardname:String
    let cardtexture:SKTexture
    let cardType:FoeCardType
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("NSCoding not supported")
    }
    init(cardType:FoeCardType)
    {
        self.cardType = cardType
        switch cardType
        {
        case .amazon:
            cardtexture = SKTexture(imageNamed: "FoeAmazonCard")
            cardname = "Amazon"
        case .asssassins:
            cardtexture = SKTexture(imageNamed: "FoeAssassinsCard")
            cardname = "Assassins"
        case .bard:
            cardtexture = SKTexture(imageNamed: "FoeBardCard")
            cardname = "Bard"
        case .carlo:
            cardtexture = SKTexture(imageNamed: "FoeCarloCard")
            cardname = "Carlo"
        case .cat:
            cardtexture = SKTexture(imageNamed: "FoeCatCard")
            cardname = "Cat"
        case .chicken:
            cardtexture = SKTexture(imageNamed: "FoeChickenCard")
            cardname = "Chicken"
        case .cultists:
            cardtexture = SKTexture(imageNamed: "FoeCultistsCard")
            cardname = "Cultists"
        case .demon:
            cardtexture = SKTexture(imageNamed: "FoeDemonCard")
            cardname = "Demon"
        case .dragon:
            cardtexture = SKTexture(imageNamed: "FoeDragonCard")
            cardname = "Dragon"
        case .dwarf:
            cardtexture = SKTexture(imageNamed: "FoeDwarfCard")
            cardname = "Dwarf"
        case .faeries:
            cardtexture = SKTexture(imageNamed: "FoeFaeriesCard")
            cardname = "Faeries"
        case .fellknight:
            cardtexture = SKTexture(imageNamed: "FoeFellKnight")
            cardname = "FellKnight"
        case .forest:
            cardtexture = SKTexture(imageNamed: "FoeForestCard")
            cardname = "Forest"
        case .ghoul:
            cardtexture = SKTexture(imageNamed: "FoeGhoulCard")
            cardname = "Ghoul"
        case .gladiator:
            cardtexture = SKTexture(imageNamed: "FoeGladiatorCard")
            cardname = "Gladiator"
        case .highpriest:
            cardtexture = SKTexture(imageNamed: "FoeHighPriestCard")
            cardname = "HighPriest"
        case .johan:
            cardtexture = SKTexture(imageNamed: "FoeJohanCard")
            cardname = "Johan"
        case .king:
            cardtexture = SKTexture(imageNamed: "FoeKingCard")
            cardname = "King"
        case .lonelyogre:
            cardtexture = SKTexture(imageNamed: "FoeLonelyOgreCard")
            cardname = "LonelyOgre"
        case .magician:
            cardtexture = SKTexture(imageNamed: "FoeMagicianCard")
            cardname = "Magician"
        case .mercanaris:
            cardtexture = SKTexture(imageNamed: "FoeMercanarisCard")
            cardname = "Mercanaris"
        case .necromancer:
            cardtexture = SKTexture(imageNamed: "FoeNecromancerCard")
            cardname = "Necromancer"
        case .queen:
            cardtexture = SKTexture(imageNamed: "FoeQueenCard")
            cardname = "Queen"
        case .raiders:
            cardtexture = SKTexture(imageNamed: "FoeRaidersCard")
            cardname = "Raiders"
        case .sandcreatures:
            cardtexture = SKTexture(imageNamed: "FoeSandCreaturesCard")
            cardname = "SandCreatures"
        case .spirits:
            cardtexture = SKTexture(imageNamed: "FoeSpiritsCard")
            cardname = "Spirits"
        case .trout:
            cardtexture = SKTexture(imageNamed: "FoeTroutCard")
            cardname = "Trout"
        case .ugkrugglug:
            cardtexture = SKTexture(imageNamed: "FoeUgKrugGlugCard")
            cardname = "UgKrugGlug"
        case .undeadking:
            cardtexture = SKTexture(imageNamed: "FoeUndeadKingCard")
            cardname = "UndeadKing"
        case .urchin:
            cardtexture = SKTexture(imageNamed: "FoeUrchinCard")
            cardname = "Urchin"
        case .visitor:
            cardtexture = SKTexture(imageNamed: "FoeVisitorCard")
            cardname = "Visitor"
        case .wizards:
            cardtexture = SKTexture(imageNamed: "FoeWizardsCard")
            cardname = "Wizards"
            
        }
        super.init(texture: cardtexture, color: .clear, size: CGSize(width:120, height:180))
    }
}

