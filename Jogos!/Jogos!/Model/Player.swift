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
	
	init (name: String, alignment : alignments) {
		self.name = name
		self.alignment = alignment
	}
	
}
