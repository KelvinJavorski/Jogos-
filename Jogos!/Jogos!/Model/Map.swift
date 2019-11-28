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
    
    func generateMap (size: Int) {
        
    }
    
    func distanceBetween(pos1 : [Int], pos2 : [Int]) {
        
    }
    func Directions(placePlayer : Place, placeTarget : Place){
        
        var direction : directions
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
        var playerAngle = atan2f(Float(placePlayer.coordenate.y),
                           Float(placePlayer.coordenate.x))
        
        var placeAngle = atan2f(Float(placeTarget.coordenate.y),
                           Float(placeTarget.coordenate.x))
//        var rotation -= CGFloat(playerAngle - placeAngle)
    
    }
    
    func criaTabuleiro(){
        let lin = 5
        let col = 5
        for linha in 0...lin{
            for coluna in 0...col{
                //Map[lin][col] = Place(name: "", imageName: "", type: .empty)
            }
        }
    }
    
    
    
}
