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
    
    var numberOfPlayers : Int!
    
    var playersPosition : [Int] = [3, 3]
    
    var direction : directions!
	
    
	
	// >>>---------> MAP GENERATION
    
    init (size: Int, mapSize: Int, numberOfPlayers : Int) {
		self.numberOfPlayers = numberOfPlayers
        
		self.createEmptyMap(size: mapSize)
		self.mapSize = mapSize
		
		
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
        
        var safeLine = Int.random(in: 0...3)
        
        for sessionToBePopulated in 0...mapSize-1 {
            for placeToBePopulated in 0...mapSize-1 {
                switch sessionToBePopulated {
                case 0:
                    switch placeToBePopulated {
                    case 0:
                        //NorthWest
                        self.map[sessionToBePopulated][placeToBePopulated] = objects[0]
                        break
                    case mapSize/2:
                        //North
                        self.map[sessionToBePopulated][placeToBePopulated] = objects[1]
                        break
                    case mapSize:
                        //NorthEast
                        self.map[sessionToBePopulated][placeToBePopulated] = objects[2]
                        break
                    default: self.map[sessionToBePopulated][placeToBePopulated] = Place()
                        break
                    }
                    break
                case mapSize/2:
                    switch placeToBePopulated {
                    case 0:
                        //East
                        self.map[sessionToBePopulated][placeToBePopulated] = objects[3]
                        break
                    case mapSize/2:
                        //Center
                        self.map[sessionToBePopulated][placeToBePopulated] = Place(name : "", imageName: "", type : .empty)
                        break
                    case mapSize:
                        //West
                        self.map[sessionToBePopulated][placeToBePopulated] = objects[4]
                        break
                    default: self.map[sessionToBePopulated][placeToBePopulated] = Place()
                        break
                    }
                    break
                case mapSize:
                    switch placeToBePopulated {
                    case 0:
                        //SouthWest
                        self.map[sessionToBePopulated][placeToBePopulated] = objects[5]
                        break
                    case mapSize/2:
                        //South
                        self.map[sessionToBePopulated][placeToBePopulated] = objects[6]
                        break
                    case mapSize:
                        //SouthEast
                        self.map[sessionToBePopulated][placeToBePopulated] = objects[7]
                        break
                    default: self.map[sessionToBePopulated][placeToBePopulated] = Place()
                        break
                    }
                    break
                default: break
                }
            }
        }
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
	
	// >>>---------> DIRECTIONS
	
	func distanceBetween(pos1 : [Int], pos2 : [Int]) {
		
	}
	
    func Directions(placePlayer : Place, placeTarget : Place) {
    
        var angle = atan2f(Float(placePlayer.coordenate.y - placePlayer.coordenate.y), Float(placePlayer.coordenate.x - placePlayer.coordenate.x))
        
        if (angle < 0) { angle += 2 * Float.pi; }
        
        var angleIntervals : [[Float]] = [[]]
        let startAngle = 0
        let endAngle = 1
        
        for interval in 1...8 {
            angleIntervals[interval][startAngle] = ((2*Float.pi)/8)*Float(interval) - (2*Float.pi)/16
            angleIntervals[interval][endAngle] = angleIntervals[interval][startAngle] + (2*Float.pi)/8 - (2*Float.pi)/16
            
            DirectionCorrection(angle: angle, angleIntervals: angleIntervals, interval: interval, startAngle: startAngle, endAngle: endAngle)
        }
        
    }
    
    func DirectionCorrection(angle : Float, angleIntervals : [[Float]], interval : Int, startAngle : Int, endAngle : Int){
        
        if (angle < angleIntervals[interval][endAngle] && angle > angleIntervals[interval][startAngle]) {
            
            switch interval {
            case 1:
                direction.self = directions.east
                break
            case 2:
                direction.self = directions.northeast
                break
            case 3:
                direction.self = directions.north
                break
            case 4:
                direction.self = directions.northwest
                break
            case 5:
                direction.self = directions.west
                break
            case 6:
                direction.self = directions.southwest
                break
            case 7:
                direction.self = directions.south
                break
            case 8:
                direction.self = directions.southeast
                break
            default: break
            }
        }
        else if (angle == angleIntervals[interval][endAngle]){
            
            switch interval {
            case 1:
                direction.self = directions.northeast
                break
            case 2:
                direction.self = directions.north
                break
            case 3:
                direction.self = directions.northwest
                break
            case 4:
                direction.self = directions.west
                break
            case 5:
                direction.self = directions.southwest
                break
            case 6:
                direction.self = directions.south
                break
            case 7:
                direction.self = directions.southeast
                break
            case 8:
                direction.self = directions.east
                break
            default: break
            }
        }
        else if (angle == angleIntervals[interval][startAngle]) {
            
            switch interval {
            case 1:
                direction.self = directions.southeast
                break
            case 2:
                direction.self = directions.east
                break
            case 3:
                direction.self = directions.northeast
                break
            case 4:
                direction.self = directions.north
                break
            case 5:
                direction.self = directions.northwest
                break
            case 6:
                direction.self = directions.west
                break
            case 7:
                direction.self = directions.southwest
                break
            case 8:
                direction.self = directions.south
                break
            default: break
            }
        }
    }

    
    
    
    
    
}
