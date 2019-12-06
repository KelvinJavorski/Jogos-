//
//  GameManager.swift
//  Jogos!
//
//  Created by Kaz Born on 27/11/19.
//  Copyright © 2019 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import UIKit

enum directions {
	case north
	case south
	case east
	case west
	case northeast
	case southeast
	case northwest
	case southwest
    case on
}

class GameManager {
	
	static let shared = GameManager()
	
	var players         : [Player] = []
	var navigator		: Navigator = Navigator()
	var currentPlayer 	: Player!
    var numberOfPlayers : Int = 0
	
	var dayTurnsLeft 	: Int!
	var playersInfoLeft : Int!
	
	enum gameStates {
		case settingup
		case initialInfo
		case dayCycle
		case nightCycle
		case ended
	}
	
	var gameState : gameStates = .settingup
	
	// >>>---------> GAME START
	
	func setupGame (playerNames: [String]) {
        //Generate new map
        navigator = Navigator(mapSize: 7, groupPosition: position(x: 1, y: 1))
        
		// Create Players from names array
        players = setupPlayers(playerNames: playerNames)
		numberOfPlayers = playerNames.count
		
		// Generate new map
		navigator.initialize(mapSize: 7, groupPosition: position(x: 3, y: 3))
		
		// Reset Turns Left
		dayTurnsLeft = numberOfPlayers * 3
		playersInfoLeft = numberOfPlayers
		
		// Set game state
		gameState = .initialInfo
	}
	
    func setupPlayers(playerNames: [String]) -> [Player]{
		
        var listOfPlayers : [Player] = []
		
        let listOfAlignments = randomizeAlignment(numberOfPlayers: playerNames.count)
        let listOfPlaces = listOfPlacesAvailable()
        
        //Define both places for each player before initialize
        
        for (index, name) in playerNames.enumerated(){
			
			let player = Player(infos: [
				.name: name,
				.alignment: listOfAlignments[index]//,
				//.firstPlace: Place,
				//.secondPlace: Place,
				//.distanceBetweenPlaces: Int
				//.directionToSecondPlace: directions
				])
			
            listOfPlayers.append(player)
        }
        return listOfPlayers
    }
    
    func listOfPlacesAvailable() -> [Place]{
        var listOfPlaces : [Place] = []
        for i in (0...navigator!.map.mapSize){
            for j in (0...navigator!.map.mapSize){
                if (navigator!.map.map[i][j].type == .empty){
                    print("vazio")
                }
                else{
                    listOfPlaces.append(navigator!.map.map[i][j])
                }
            }
        }
        return listOfPlaces
    }
    
    func defineEachPlayerPlaces(players : [Player]){
        for player in players{
            //Define players reference places.
            if (player.alignment == .murderer){
                player.place = Place(name: "", imageName: "", type: .safehouse)
            }
            else{
                player.place = Place(name: "", imageName: "", type: .empty)
            }
        }
    }
    
	func hasShownPlayerInfo () {
		playersInfoLeft -= 1
		
		if playersInfoLeft >= 0 {
			gameState = .dayCycle
		}
	}
	
	// >>>---------> DURING THE GAME
	
	
	
	func nextTurn (direction: directions) {
		if dayTurnsLeft > 0 {
			
			// check next position on map
			
			// if trap OR safehouse {
			//    device on the table -> end game
			// } else {
			//    pass the device -> new place info
			//	  reset timer
			//    turnsLeft -= 1
			// }
		} else {
			
			endGame(winner: .murderer)
			
		}
	}
	
	func hasGameEnded () -> Bool {
		
		if dayTurnsLeft > 0 {
			
			gameState = .nightCycle
			return true
		}
		
		return false
	}
    
    func randomizeAlignment (numberOfPlayers : Int) -> [Player.alignments]
    {
        let innocent = Player.alignments.innocent
        let murderer = Player.alignments.murderer
        let sequenceOfAlignments = [innocent, murderer, innocent, innocent]
        
        return sequenceOfAlignments.shuffled()
    }
    
	func getNextPlayer () -> Player {
		
		// Array cycles through the players so
		// the next player is always at index 0
		let nextPlayer = players[0]
		
		players.remove(at: 0)
		players.append(nextPlayer)
		
		return nextPlayer
	}
	
	// >>>---------> GAME ENDING
	
	private init(){}
    
	enum winners {
		case murderer
		case inocent
	}
	
	var winner : winners!
	
	func endGame (winner : winners ) {
		
	}
	
	// >>>-----------> CONTENT
	
	let innocentObjective = "You were visiting the Island with a group of tourists when you got lost.\nFind the BOAT that took you here before nightfall to save yourself."
	
	let murdererObjective = ""
	
	let normalTextAtributes : [NSAttributedString.Key:Any] =
		[.backgroundColor: UIColor.init(white: 1.0, alpha: 0.0),
		 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20.0, weight: .regular)]
	
	let boldTextAttributes : [NSAttributedString.Key:Any] =
		[.backgroundColor: UIColor.init(white: 1.0, alpha: 0.0),
		 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20.0, weight: .semibold)]
	
	
	func getAttrStrObjective (objective: String) -> NSMutableAttributedString {
		
		let attributedStr = NSMutableAttributedString(string: objective, attributes: normalTextAtributes)
		
		let range : NSRange = NSString(string: objective).range(of: "BOAT")
			
		attributedStr.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 20.0, weight: .semibold), range: range)
		
		return attributedStr
	}
	
	func getAttrStrObjects(firstObj : String, distance: Int, direction: directions, secondObject: String, direction2: directions) -> NSMutableAttributedString {
		
		let attrStr = NSMutableAttributedString(string: "You see the\n", attributes: normalTextAtributes)
		
		attrStr.append(NSAttributedString(string: firstObj, attributes: boldTextAttributes))
		
		attrStr.append(NSAttributedString(string: String(format: "%dkm to the ", distance), attributes: normalTextAtributes))
		
		attrStr.append(NSAttributedString(string: directionToStr(direction: direction), attributes: boldTextAttributes))
		
		attrStr.append(NSAttributedString(string: ".\n\nYou remember that ", attributes: normalTextAtributes))
		
		attrStr.append(NSAttributedString(string: directionToStr(direction: direction2), attributes: boldTextAttributes))
		
		attrStr.append(NSAttributedString(string: " of the ", attributes: normalTextAtributes))
		
		attrStr.append(NSAttributedString(string: firstObj, attributes: boldTextAttributes))
		
		attrStr.append(NSAttributedString(string: " is  the ", attributes: normalTextAtributes))
		
		attrStr.append(NSAttributedString(string: secondObject, attributes: boldTextAttributes))
		
		attrStr.append(NSAttributedString(string: ".", attributes: normalTextAtributes))
		
		return attrStr
	}
	
	func directionToStr (direction: directions) -> String {
		switch direction {
		case .north:
			return "NORTH"
		case .south:
			return "SOUTH"
		case .east:
			return "EAST"
		case .west:
			return "WEST"
		case .northeast:
			return "NORTHEAST"
		case .northwest:
			return "NORTHWEST"
		case .southeast:
			return "SOUTHEAST"
		case .southwest:
			return "SOUTHWEST"
        case .on:
            return "ON"
		}
	}
	
	
	
}
