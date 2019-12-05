//
//  GameManager.swift
//  Jogos!
//
//  Created by Kaz Born on 27/11/19.
//  Copyright © 2019 Kelvin Javorski Soares. All rights reserved.
//

import Foundation
import UIKit

enum  directions {
	case north
	case south
	case east
	case west
	case northeast
	case southeast
	case northwest
	case southwest
}

class GameManager {
	
	static let shared = GameManager()
	
	var players         : [Player] = []
	var map 			: Map!
	var currentPlayer 	: Player!
    var numberOfPlayers : Int!
	
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
		// Create Players from names array
		
		// Generate new map
		
		// Reset Turns Left
		
		playersInfoLeft = playerNames.count
		gameState = .initialInfo
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
	
	
	
	
	func getNextPlayer () -> Player {
		
		// Array cycles through the players so
		// the next player is always at index 0
		let nextPlayer = players[0]
		
		players.remove(at: 0)
		players.append(nextPlayer)
		
		return nextPlayer
	}
	
	// >>>---------> GAME ENDING
	
	
	
    private init(){
    }
    
	enum winners {
		case murderer
		case inocent
	}
	
	var winner : winners!
	
	func endGame (winner : winners ) {
		
	}
	
	// >>>-----------> CONTENT
	
	let innocentObjective = "You were visiting the Island with a group of tourists when you got lost.\nFind the BOAT that took you here before nightfall to save yourself."
	
	let normalTextAtributes : [NSAttributedString.Key:Any] =
		[.backgroundColor: UIColor.init(white: 1.0, alpha: 0.0),
		 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20.0, weight: .regular)]
	
	let boldTextAttributes : [NSAttributedString.Key:Any] =
		[.backgroundColor: UIColor.init(white: 1.0, alpha: 0.0),
		 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 20.0, weight: .semibold)]
	
	
	func getAttrStrInnocentObjective () -> NSMutableAttributedString {
		
		let attributedStr = NSMutableAttributedString(string: innocentObjective, attributes: normalTextAtributes)
		
		let location = innocentObjective.distance(from: innocentObjective.startIndex, to: innocentObjective.firstIndex(of: "B")!)
		attributedStr.addAttribute(NSAttributedString.Key.font, value: UIFont.systemFont(ofSize: 20.0, weight: .semibold), range: NSRange(location: location, length: 4))
		
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
		}
	}
	
	
	
}
