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
    
    init (mapSize: Int, groupPosition: position) {
        self.map = Map(mapSize: mapSize)
        self.groupPosition = groupPosition
    }
    var map : Map!
    
    var direction : directions!
    
    var groupPosition : position!
    
    func directionBetween(from : Place, to : Place) -> directions {
        if (from.coordenate.x == to.coordenate.x) {
            if (from.coordenate.y < to.coordenate.y) {
                return.south
            }
            else {
                return.north
            }
        }
        if (from.coordenate.y == to.coordenate.y) {
            if (from.coordenate.x < to.coordenate.x) {
                return.west
            }
            else {
                return.east
            }
        }
        if (from.coordenate.x < to.coordenate.x) {
            if (from.coordenate.y < to.coordenate.y) {
                direction.self = directions.northwest
            }
            else if (from.coordenate.y > to.coordenate.y) {
                return.southwest
            }
        }
        else if (from.coordenate.x > to.coordenate.x) {
            if (from.coordenate.y < to.coordenate.y) {
                return.southeast
            }
            else if (from.coordenate.y > to.coordenate.y) {
                return.northeast
            }
        }
        return.on
    }
    
    func distanceBetween(from : Place, to : Place) -> Int{
        let distance = abs(from.coordenate.x - to.coordenate.x) + (from.coordenate.y - to.coordenate.y)
        
        return distance
    }
    
    func moveGroup(to: directions) {
        switch to {
        case .north:
            self.groupPosition.y = self.groupPosition.y - 1
        break
        case .south:
            self.groupPosition.y = self.groupPosition.y + 1
        break
        case .east:
            self.groupPosition.x = self.groupPosition.x + 1
        break
        case .west:
            self.groupPosition.x = self.groupPosition.x - 1
        break
        case .northeast:
            self.groupPosition.x = self.groupPosition.x + 1
            self.groupPosition.y = self.groupPosition.y - 1
        break
        case .northwest:
            self.groupPosition.x = self.groupPosition.x - 1
            self.groupPosition.y = self.groupPosition.y - 1
        break
        case .southeast:
            self.groupPosition.x = self.groupPosition.x + 1
            self.groupPosition.y = self.groupPosition.y + 1
        break
        case .southwest:
            self.groupPosition.x = self.groupPosition.x - 1
            self.groupPosition.y = self.groupPosition.y + 1
        break
        default:
            break
        }
    }
    
    func groupPlace(playerPosition: position) -> Place{
        return map.map[playerPosition.x][playerPosition.y]
    }
    
}
