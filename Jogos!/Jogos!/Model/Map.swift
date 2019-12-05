//
//  Map.swift
//  Jogos!
//
//  Created by Kaz Born on 27/11/19.
//  Copyright © 2019 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class Map {
    var map : [[Place]] = [[]]
	var mapSize : Int = 7
    
    var playersPosition : [Int] = [3, 3]
    
    var direction : directions!
	
    
	
	// >>>---------> MAP GENERATION
    
    init (mapSize: Int) {
        
		self.createEmptyMap(size: mapSize)
		self.mapSize = mapSize
		
		
    }
    
//    func Positions() {
//        DetermineAmount(numberOfPlayers: self.numberOfPlayers)
//
//        let objects : [Place] = [Place(name : "", imageName: "", type : .empty),
//                                Place(name : "", imageName: "", type : .empty),
//                                Place(name : "", imageName: "", type : .empty),
//                                Place(name : "", imageName: "", type : .empty),
//                                Place(name : "", imageName: "", type : .empty),
//                                Place(name : "", imageName: "", type : .empty),
//                                Place(name : "", imageName: "", type : .empty),
//                                Place(name : "", imageName: "", type : .empty)].shuffled()
//
//        self.map[self.mapSize/2 +1][self.mapSize/2 +1] = Place(name : "safe", imageName: "", type : .empty)
//
//    }
    
    func DemoPositions() {
        
    }
    
    func DetermineAmount(numberOfPlayers : Int) {
        if (numberOfPlayers % 2 == 0) {
            self.mapSize = 5 + (numberOfPlayers - 5)/2
        }
//        for sessionToBePopulated in 0...mapSize-1 {
//            for placeToBePopulated in 0...mapSize-1 {
//                self.map[sessionToBePopulated][placeToBePopulated] = Place()
//            }
//        }
    }
    
    func populateMap() {
        // Put Safehouse
        
        // Put Misc Places
        
        // Put Traps
    }
    
	func createEmptyMap(size: Int){
		for line in 0...size{
			for column in 0...size{
				map[line][column] = Place(name: "", imageName: "", type: .empty)
			}
		}
	}
	
	// >>>---------> DIRECTION
    
}
