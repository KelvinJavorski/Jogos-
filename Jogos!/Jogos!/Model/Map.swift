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
	
    func generateMap (size: Int) {
		
		createEmptyMap(size: 5)
		
		populateMap()
		
    }
    
	func createEmptyMap(size: Int){
		for line in 0...size{
			for column in 0...size{
				map[line][column] = Place(name: "", imageName: "", type: .empty)
			}
		}
	}
	
	func populateMap() {
		// Put Safehouse
		
		// Put Misc Places
		
		// Put Traps
	}
	
	
	// >>>---------> DIRECTIONS
	
	func distanceBetween(pos1 : [Int], pos2 : [Int]) {
		
	}
	
    func Directions(placePlayer : Place, placeTarget : Place){
    
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
