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
	
	var turnsLeft 	: Int!
	
	
	// >>>---------> GAME START
	
	func setupGame () {
		// Generate new map
		
		// Reset Turns Left
	
		
	}
	
	// >>>---------> DURING THE GAME
	
	func nextTurn () {
		// Check Turns left
		
		// Move Players (if appliable)
		
		// Check Player Location
		
		// if trap OR safehouse {
		//    device on the table -> end game
		// } else {
		//    pass the device -> new place info
		//	  reset timer
		// }
		
		
	}
	
	// >>>---------> GAME ENDING
	
    private init(){
    }
    
	enum winner {
		case murderer
		case inocents
	}
	
	func endGame (winner : winner ) {
		
	}
	
	
	
	
	
}
