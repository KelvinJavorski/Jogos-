//
//  GameManager.swift
//  Jogos!
//
//  Created by Kaz Born on 27/11/19.
//  Copyright © 2019 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class GameManager {
	
	static let shared = GameManager()
	
	var players         : [Player] = []
	var map 			: Map!
	var currentPlayer 	: Player!
    var numberOfPlayers : Int!
	
	var turnsLeft 		: Int!
	
	
	// >>>---------> GAME START
	
	func setupGame () {
		// Generate new map
		
		// Reset Turns Left
	
		
	}
	
	// >>>---------> DURING THE GAME
	
	enum directions {
		case north
		case south
		case east
		case west
	}
	
	func nextTurn (direction: directions) {
		
		if turnsLeft > 0 {
			
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
	
	func getNextPlayer () {
		
		// Array cycles through the players so
		// the next player is always at index 0
		currentPlayer = players[0]
		
		players.remove(at: 0)
		players.append(currentPlayer)
		
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
	
	
	
	
	
}
