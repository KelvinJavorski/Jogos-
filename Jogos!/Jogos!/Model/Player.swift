//
//  Player.swift
//  Jogos!
//
//  Created by Kaz Born on 27/11/19.
//  Copyright © 2019 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class Player {
	
	enum infos {
		case name
		case alignment
		case firstPlace
		case secondPlace
		case distanceBetweenPlaces
		case directionToSecondPlace
	}
	
	var name : String = ""
	
	enum alignments  {
		case murderer
		case innocent
	}
	
	var alignment : alignments =  .innocent
	
	var place 					: Place = Place()
	var secondPlace 			: Place = Place()
	var directionToSecondPlace 	: directions = .north
	var distanceToSecondPlace  	: Int = 0
	
	init (name: String) {
		self.name = name
	}
	
	init (infos: [infos : Any]) {
		self.name 					= infos[.name] as! String
		self.alignment 				= infos[.alignment] as! alignments
		self.place 					= infos[.firstPlace] as! Place
		self.secondPlace 			= infos[.secondPlace] as! Place
		self.directionToSecondPlace = infos[.directionToSecondPlace] as! directions
		self.distanceToSecondPlace  = infos[.distanceBetweenPlaces] as! Int
	}
	
	
	
}
