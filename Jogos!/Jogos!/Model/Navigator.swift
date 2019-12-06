//
//  Navigator.swift
//  Jogos!
//
//  Created by Kevin Ribeiro on 05/12/19.
//  Copyright © 2019 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

struct position {
    var x : Int!
    var y : Int!
}

class Navigator {
	
    var map : Map = Map()
    
    var direction : directions!
    
    var groupPosition : position!
    
	init () {}
	
	func initialize (mapSize: Int, groupPosition: position) {
		map.initialize(mapSize: mapSize)
		self.groupPosition = groupPosition
	}
	
    func directionBetween(from: position, to: position) -> directions {
        if (from.x == to.x) {
            if (from.y < to.y) {
                return .south
            }
            else {
                return .north
            }
        }
        if (from.y == to.y) {
            if (from.x < to.x) {
                return .west
            }
            else {
                return .east
            }
        }
        if (from.x < to.x) {
            if (from.y < to.y) {
                return .northwest
            }
            else if (from.y > to.y) {
                return .southwest
            }
        }
        else if (from.x > to.x) {
            if (from.y < to.y) {
                return .southeast
            }
            else if (from.y > to.y) {
                return .northeast
            }
        }
        return .on
    }
    
    func distanceBetween(from: position, to: position) -> Int {
        let distance = abs(from.x - to.x) + abs(from.y - to.y)
        
        return distance
    }
    
    func moveGroup(to: directions) {
        switch to {
        case .north:
            self.groupPosition.y -= 1
        case .south:
            self.groupPosition.y += 1
        case .east:
            self.groupPosition.x += 1
        case .west:
            self.groupPosition.x -= 1
        case .northeast:
            self.groupPosition.x += 1
            self.groupPosition.y -= 1
        case .northwest:
            self.groupPosition.x -= 1
            self.groupPosition.y -= 1
        case .southeast:
            self.groupPosition.x += 1
            self.groupPosition.y += 1
        case .southwest:
            self.groupPosition.x -= 1
            self.groupPosition.y += 1
        default:
            break
        }
    }
    
    func groupPlace() -> Place {
        return map.mapMatrix[groupPosition.x][groupPosition.y]
    }
    
}
