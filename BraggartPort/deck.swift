//
//  deck.swift
//  BraggartPort
//
//  Created by Murray Butler on 11/11/2019.
//  Copyright © 2019 Haxolotl. All rights reserved.
//

import SpriteKit
import GameplayKit
import Foundation

class Card : SKSpriteNode
{
    let cardname:String
    let cardtexture:SKTexture
    let boastcardvalue:Int
    let finalcardvalue:Int
    var cardnames:[String] = ["UnfortunateTrout","AngryChicken","ViciousCat","Johan","TerrifiedUrchin","DrunkenDwarves",
    "SimonTheOgre","AnnoyingBard","TribeOfFaeries","CaptainCarlo","ForestDenizens", "Wizards", "Ghoul", "Damned Spirits","PompousCultists",
    "HairyRaiders","HighPriest","UgKrugGlug","Gladiator","SkilledAssassins","Mercenaries", "AmazonWarrior", "RogueMagician", "FellKnight", "King", "UndeadKing",
    "SandCreatures","QueenOfSnakes","MalevolentVisitor","Necromancer","FoulestDragon","DeepestDemon", "RanScreaming", "WetMyself",
    "HidInTerror", "WitnessedKilling", "ThrewStones", "BeatenAndRobbed", "Captured", "AccidentallySummoned", "PillagedLair", "ForcedPortrait",
    "OpenedCrate", "MarriedSister", "ForcedMarriage", "DefendedWomenAndChildren", "HeroicTale", "BarelyOvercame", "DancedToImpress", "WokeUp",
    "MysteriousPotion", "BarFight", "VeryDrunk", "DisguisedMyself", "LaidAmbush", "ElementalWeapons", "MadeAHat", "SkilfullyOutwitted", "ChariotRace",
    "CoveredInOil", "LedUprising", "RescuedPrincess", "HeroicallySlew", "FourElements", "FriendsAndFamily", "SwooningMaiden", "WitchSpell", "InfiltratedCamp",
    "RetainedBodyguard", "MightySteed", "QueenBedchamber", "ForsakenTemple", "ForbiddenSorcery", "BootsAndSmile", "DistantBattlefield", "Possessed", "FrozenWastes",
    "RuinedCitadel", "HidCrying", "BannedFromTaverns", "GetRidOfSmell", "BetterPerson", "UnearthlyLight", "Barmaids", "RoyalCourt", "Deeds", "Knighted", "KingsPortrait",
    "DistantLands", "CommandArmies", "KingsChampion", "WarBlessing"]
    var cardtextures:[String] = ["FoeTroutCard", "FoeChickenCard", "FoeCatCard", "FoeJohanCard", "FoeUrchinCard", "FoeDwarfCard", "FoeLonelyOgreCard", "FoeBardCard",
    "FoeFaeriesCard", "FoeCarloCard", "FoeForestCard", "FoeWizardsCard", "FoeGhoulCard", "FoeSpiritsCard", "FoeCultistsCard", "FoeRaidersCard", "FoeUgKrugGlugCard", "FoeHighPriestCard",
    "FoeGladiatorCard", "FoeAssassinsCard", "FoeMercenarisCard", "FoeAmazonCard", "FoeMagicianCard", "FoeFellKnight", "FoeKingCard", "FoeUndeadKingCard", "FoeSandCreaturesCard", "FoeQueenCard", "FoeVisitorCard",
    "FoeNecromancerCard", "FoeDragonCard", "FoeDemonCard", "DeedScreamingCard", "DeedWetCard", "DeedTerrorCard", "DeedKillingCard", "DeedStonesCard", "DeedBeatenCard", "DeedCapturedCard", "DeedSummonedCard", "DeedPillagedCard", "DeedPortraitCard",
    "DeedOpenedCard", "DeedSisterCard", "DeedMarriedCard", "DeedDefendedCard", "DeedHeroicCard", "DeedOvercameCard", "DeedDancedCard", "DeedWokeUpCard", "DeedLovePotionCard",
    "DeedBarFightCard", "DeedDrunkCard", "DeedDisguisedCard", "DeedAmbushCard", "DeedWeaponsCard", "DeedHatCard", "DeedOutwittedCard", "DeedChariotCard", "DeedOilCard", "DeedUprisingCard",
    "DeedPrincessCard", "DeedSlayerCard", "DeedElementsCard", "SceneFamilyCard", "SceneMaidenCard", "SceneSpellCard", "SceneInfiltrationCard", "SceneBodyguardCard", "SceneSteedCard",
    "SceneBedchamberCard", "SceneTempleCard", "SceneSorceryCard", "SceneBootsSmileCard", "SceneBattlefieldCard", "SceneWarlordCard", "SceneFrozenCard", "SceneCitadelCard", "ResultCryingCard",
    "ResultBannedCard", "ResultSmellCard", "ResultBetterPersonCard", "ResultGlowCard", "ResultBarmaidsCard", "ResultCourtCard", "ResultDeedsCard", "ResultKnightedCard", "ResultPaintingCard",
    "ResultTreasuresCard", "ResultArmiesCard", "ResultChampionCard", "ResultGodofwarCard"]
    var boastcardvalues:[Int] = [1,1,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,6,6,7,7,7,7,8,8,8,9,9,1,1,2,2,2,3,3,3,3,4,4,4,4,5,5,5,5,5,6,6,6,6,6,7,7,7,7,8,8,8,9,9,1,2,2,3,3,4,4,5,5,6,6,7,7,8,1,2,2,3,3,4,4,5,5,6,6,7,7,8]
    var finalcardvalues:[Int] = [1,1,1,1,1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,5,5,1,1,1,1,1,2,2,2,2,2,2,2,2,3,3,3,3,3,3,3,3,3,3,4,4,4,4,4,4,4,5,5,1,1,1,2,2,2,2,3,3,3,3,4,4,4,1,1,1,2,2,2,2,3,3,3,3,4,4,4]
    required init?(coder aDecoder: NSCoder)
    {
        fatalError("NSCoding not supported")
    }
    init(index:Int)
    {
        cardname = cardnames[index]
        cardtexture = SKTexture(imageNamed: cardtextures[index])
        //cardtexture = SKTexture(imageNamed: "FoeFellKnightCard")
        boastcardvalue = boastcardvalues[index]
        finalcardvalue = finalcardvalues[index]
        super.init(texture: cardtexture, color: .clear, size: CGSize(width:120, height:180))
    }
    func getBoastValue()->Int
    {
        return boastcardvalue
    }
    func getFinalValue()->Int
    {
        return finalcardvalue
    }
    func getCardName()->String
    {
        return cardname
    }
}

