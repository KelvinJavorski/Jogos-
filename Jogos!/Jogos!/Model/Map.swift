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
    var mapSize : Int
    
    var numberOfPlayers : Int
    
    var playersPosition : [Int] = [3, 3]
    
    var direction : directions!
	
    enum directions {
        case north
        case northeast
        case east
        case southeast
        case south
        case southwest
        case west
        case northwest
    }
	
	// >>>---------> MAP GENERATION
    
    init (size: Int, mapSize: Int, numberOfPlayers : Int) {
		self.numberOfPlayers = numberOfPlayers
        
		createEmptyMap(size: 5)
		populateMap()
        
        DetermineAmount(numberOfPlayers : numberOfPlayers)
		
    }
    
    func Positions() {
        DetermineAmount(numberOfPlayers: self.numberOfPlayers)
        
        let objects : [Place] = [Place(name : "", imageName: "", type : .empty),
                                Place(name : "", imageName: "", type : .empty),
                                Place(name : "", imageName: "", type : .empty),
                                Place(name : "", imageName: "", type : .empty),
                                Place(name : "", imageName: "", type : .empty),
                                Place(name : "", imageName: "", type : .empty),
                                Place(name : "", imageName: "", type : .empty),
                                Place(name : "", imageName: "", type : .empty)].shuffled()
        
        self.map[self.mapSize/2 +1][self.mapSize/2 +1] = Place(name : "safe", imageName: "", type : .empty)
        
    }
    
    func DemoPositions() {
        
    }
    
//    func Positions() {
//        DetermineAmount(numberOfPlayers: self.numberOfPlayers)
//
//        let objects : [Place] = [Place(name : "", imageName: "", type : .empty),
//                                 Place(name : "", imageName: "", type : .empty),
//                                 Place(name : "", imageName: "", type : .empty),
//                                 Place(name : "", imageName: "", type : .empty),
//                                 Place(name : "", imageName: "", type : .empty),
//                                 Place(name : "", imageName: "", type : .empty),
//                                 Place(name : "", imageName: "", type : .empty),
//                                 Place(name : "", imageName: "", type : .empty)].shuffled()
//
//        var safeLine = Int.random(in: 0...3)
//
//        for sessionToBePopulated in 0...mapSize-1 {
//            for placeToBePopulated in 0...mapSize-1 {
//                switch sessionToBePopulated {
//                case 0:
//                    switch placeToBePopulated {
//                    case 0:
//                        //NorthWest
//                        self.map[sessionToBePopulated][placeToBePopulated] = objects[0]
//                        break
//                    case mapSize/2:
//                        //North
//                        self.map[sessionToBePopulated][placeToBePopulated] = objects[1]
//                        break
//                    case mapSize:
//                        //NorthEast
//                        self.map[sessionToBePopulated][placeToBePopulated] = objects[2]
//                        break
//                    default: self.map[sessionToBePopulated][placeToBePopulated] = Place()
//                        break
//                    }
//                    break
//                case mapSize/2:
//                    switch placeToBePopulated {
//                    case 0:
//                        //East
//                        self.map[sessionToBePopulated][placeToBePopulated] = objects[3]
//                        break
//                    case mapSize/2:
//                        //Center
//                        self.map[sessionToBePopulated][placeToBePopulated] = Place(name : "", imageName: "", type : .empty)
//                        break
//                    case mapSize:
//                        //West
//                        self.map[sessionToBePopulated][placeToBePopulated] = objects[4]
//                        break
//                    default: self.map[sessionToBePopulated][placeToBePopulated] = Place()
//                        break
//                    }
//                    break
//                case mapSize:
//                    switch placeToBePopulated {
//                    case 0:
//                        //SouthWest
//                        self.map[sessionToBePopulated][placeToBePopulated] = objects[5]
//                        break
//                    case mapSize/2:
//                        //South
//                        self.map[sessionToBePopulated][placeToBePopulated] = objects[6]
//                        break
//                    case mapSize:
//                        //SouthEast
//                        self.map[sessionToBePopulated][placeToBePopulated] = objects[7]
//                        break
//                    default: self.map[sessionToBePopulated][placeToBePopulated] = Place()
//                        break
//                    }
//                    break
//                default: break
//                }
//            }
//        }
//    }
    
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
	
	// >>>---------> DIRECTIONS
	
	func distanceBetween(placePlayer : Place, placeTarget : Place) {
		
	}
    
    func Directions(placePlayer : Place, placeTarget : Place) {
        if (placePlayer.coordenate.x == placeTarget.coordenate.x) {
            if (placePlayer.coordenate.y < placeTarget.coordenate.y) {
                direction.self = directions.south
            }
            else {
                direction.self = directions.north
            }
        }
        if (placePlayer.coordenate.y == placeTarget.coordenate.y) {
            if (placePlayer.coordenate.x < placeTarget.coordenate.x) {
                direction.self = directions.west
            }
            else {
                direction.self = directions.east
            }
        }
        if (placePlayer.coordenate.x < placeTarget.coordenate.x) {
            if (placePlayer.coordenate.y < placeTarget.coordenate.y) {
                direction.self = directions.northwest
            }
            else if (placePlayer.coordenate.y > placeTarget.coordenate.y) {
                direction.self = directions.southwest
            }
        }
        else if (placePlayer.coordenate.x > placeTarget.coordenate.x) {
            if (placePlayer.coordenate.y < placeTarget.coordenate.y) {
                direction.self = directions.southeast
            }
            else if (placePlayer.coordenate.y > placeTarget.coordenate.y) {
                direction.self = directions.northeast
            }
        }
    }
    
}
