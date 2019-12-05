//
//  Player.swift
//  Jogos!
//
//  Created by Kaz Born on 27/11/19.
//  Copyright © 2019 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class Player {
	
	var name : String = ""
	
	enum alignments  {
		case murderer
		case inocent
	}
	
	var alignment : alignments =  .inocent
	
	var place : Place!
	
	var secondPlace : Place!
	var directionToSecondPlace : directions!
	
	init (name: String) {
		self.name = name
	}
	
	init (name: String, alignment: alignments, place: Place, secondPlace: Place) {
		self.name  = name
		self.alignment = alignment
		self.place = place
		self.secondPlace = secondPlace
		
//		GET DIRECTION TO SECOND PLACE!!!!
		
	}
	
	
	
}
