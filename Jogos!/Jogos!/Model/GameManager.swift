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
	
	var map 			:  Map!
	var players         : [Player] = []
	var currentPlayer 	: Player!
    var numberOfPlayers : Int!
	
	var turnsLeft 	: Int!
	
    private init(){
    }
    
	enum winner {
		case murderer
		case inocents
	}
	
	func endGame (winner : winner ) {
		
	}
	
	func nextTurn () {
		
	}
	
}
