//
//  deck.swift
//  BraggartPort
//
//  Created by Murray Butler on 11/11/2019.
//  Copyright © 2019 Haxolotl. All rights reserved.
//

import SpriteKit
import GameplayKit

class Card : SKSpriteNode
{
    let cardname:String
    let cardtexture:SKTexture
    let boastcardvalue:Int8
    let finalcardvalue:Int8
    var cardnames:[String] = ["UnfortunateTrout","AngryChicken","ViciousCat","Johan","TerrifiedUrchin","DrunkenDwarves",
    "SimonTheOgre","AnnoyingBard","TribeOfFaeries","CaptainCarlo","ForestDenizens","Damned Spirits","PompousCultists",
    "HairyRaiders","HighPriest","UgKrugGlug","Gladiator","SkilledAssassins","Mercenaries", "FellKnight", "King", "UndeadKing",
    "SandCreatures","QueenOfSnakes","MalevolentVisitor","Necromancer","FoulestDragon","DeepestDemon", "RanScreaming", "WetMyself",
    "HidInTerror", "WitnessedKilling", "ThrewStones", "BeatenAndRobbed", "Captured", "AccidentallySummoned", "PillagedLair", "ForcedPortrait",
    "OpenedCrate", "MarriedSister", "ForcedMarriage", "DefendedWomenAndChildren", "HeroicTale", "BarelyOvercame", "DancedToImpress", "WokeUp",
    "MysteriousPotion", "BarFight", "VeryDrunk", "DisguisedMyself", "LaidAmbush", "ElementalWeapons", "MadeAHat", "SkilfullyOutwitted", "ChariotRace",
    "CoveredInOil", "LedUprising", "RescuedPrincess", "HeroicallySlew", "FourElements", "FriendsAndFamily", "SwooningMaiden", "WitchSpell", "InfiltratedCamp",
    "RetainedBodyguard", "MightySteed", "QueenBedchamber", "ForsakenTemple", "ForbiddenSorcery", "BootsAndSmile", "DistantBattlefield", "Possessed", "FrozenWastes",
    "RuinedCitadel", "HidCrying", "BannedFromTaverns", "GetRidOfSmell", "BetterPerson", "UnearthlyLight", "Barmaids", "RoyalCourt", "Deeds", "Knighted", "KingsPortrait",
    "DistantLands", "CommandArmies", "KingsChampion", "WarBlessing"]
    var cardtextures:[String] = ["FoeTroutCard", "FoeChickenCard", "FoeCatCard", "FoeJohanCard", "FoeUrchinCard", "FoeDwarfCard", "FoeLonelyOgreCard", "FoeBardCard",
    "FoeFaeriesCard", "FoeCarloCard", "FoeForestCard", "FoeSpiritsCard", "FoeCultistsCard", "FoeRaidersCard", "FoeGladiatorCard", "FoeMercenarisCard", "FoeFellKnightCard",
    "FoeKingCard", "FoeUndeadKingCard", "FoeSandCreaturesCard", "FoeQueenCard", "FoeVistorCard", "FoeNecromancerCard", "FoeDragonCard", "FoeDemonCard", "DeedScreamingCard",
    "DeedWetCard", "DeedTerrorCard", "DeedKillingCard", "DeedStonesCard", "DeedBeatenCard", "DeedCapturedCard", "DeedSummonedCard", "DeedPillagedCard", "DeedPortraitCard",
    "DeedOpenedCard", "DeedSisterCard", "DeedMarriedCard", "DeedDefendedCard", "DeedHeroicCard", "DeedOvercameCard", "DeedDancedCard", "DeedWokeUpCard", "DeedLovePotionCard",
    "DeedBarFightCard", "DeedDrunkCard", "DeedDisguisedCard", "DeedAmbushCard", "DeedWeaponsCard", "DeedHatCard", "DeedOutwittedCard", "DeedChariotCard", "DeedOilCard", "DeedUprisingCard",
    "DeedPrincessCard", "DeedSlayerCard", "DeedElementsCard", "SceneFamilyCard", "SceneMaidenCard", "SceneSpellCard", "SceneInfiltratedCard", "SceneBodyguardCard", "SceneSteedCard",
    "SceneBedchamberCard", "SceneTempleCard", "SceneSorceryCard", "SceneBootsSmile", "SceneBattlefieldCard", "SceneWarlordCard", "SceneFrozenCard", "SceneCitadelCard", "ResultCryingCard",
    "ResultBannedCard", "ResultSmellCard", "ResultBetterPersonCard", "ResultGlowCard", "ResultBarmaidsCard", "ResultCourtCard", "ResultDeedsCard", "ResultKnightCard", "ResultPaintingCard",
    "ResultTreasuresCard", "ResultsArmiesCard", "ResultChampionCard", "ResultGodofwarCard"]
    var boastcardvalues:[Int8] = [1,1,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,6,6,7,7,7,7,8,8,8,9,9,1,1,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,6,6,7,7,7,7,8,8,8,9,9,1,2,2,3,3,4,4,5,5,6,6,7,7,8,1,2,2,3,3,4,4,5,5,6,6,7,7,8]
    var finalcardvalues:[Int8] = [1,1,1,1,1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,5,5,1,1,1,1,1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,5,5,1,1,1,2,2,2,2,3,3,3,3,4,4,4,1,1,1,2,2,2,2,3,3,3,3,4,4,4]
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("NSCoding not supported")
    }
    init(index:Int)
    {
        cardname = cardnames[index]
        cardtexture = SKTexture(imageNamed: cardtextures[index])
        boastcardvalue = boastcardvalues[index]
        finalcardvalue = finalcardvalues[index]
        super.init(texture: cardtexture, color: .clear, size: CGSize(width:120, height:180))
    }
}

