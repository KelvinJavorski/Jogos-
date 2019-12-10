//
//  Map.swift
//  Jogos!
//
//  Created by Kaz Born on 27/11/19.
//  Copyright © 2019 Kelvin Javorski Soares. All rights reserved.
//

import Foundation

class Map {
//    var mapMatrix = [[Place?]]
    var mapMatrix : [[Place?]] = [[]]
	var mapSize : Int = 7

    var playersPosition : [Int] = [3, 3]
    
    var direction : directions!
	
	// >>>---------> MAP GENERATION
    
	init  () { }
	
    func initialize (mapSize: Int) {
		self.mapSize = mapSize
        mapGeneration()
    }
    
    func mapGeneration() {
        
        populateNil()
        
        let spawnPosition = mapSize/2
        self.mapMatrix[spawnPosition][spawnPosition] = Place(name: "Spawn", imageName: "Spawn", type: Place.types.spawn)
        
        randomizeSafe()
        
        let objects : [Place] = [Place(name: "objeto0", imageName: "objeto0", type: .misc),Place(name: "objeto1", imageName: "objeto1", type: .misc),Place(name: "objeto2", imageName: "objeto2", type: .misc),Place(name: "objeto3", imageName: "objeto3", type: .misc),Place(name: "objeto4", imageName: "objeto4", type: .misc),Place(name: "objeto5", imageName: "objeto5", type: .misc),Place(name: "objeto6", imageName: "objeto6", type: .misc),Place(name: "objeto7", imageName: "objeto7", type: .misc)]
        
        let amountOfEmptyObjects = (mapSize * mapSize) - objects.count
        
        var empty : [Place] = []
        for _ in (0...amountOfEmptyObjects - 1) {
            empty.append(Place(name: "Empty", imageName: "Empty", type: .empty))
        }
        
        var objectsAndEmpty = objects + empty
        objectsAndEmpty = objectsAndEmpty.shuffled()
        
        while (objectsAndEmpty.count > 0) {
            for i in (0...(self.mapSize - 1)) {
                for j in (0...(self.mapSize - 1)) {
                    if (self.mapMatrix[i][j] == nil) {
                        let place = objectsAndEmpty[objectsAndEmpty.count - 1]
                        self.mapMatrix[i][j] = place
                        if(place.type == .misc){
                            self.mapMatrix[i][j]!.position.x = i
                            self.mapMatrix[i][j]!.position.y = j
                        }
                        objectsAndEmpty = objectsAndEmpty.dropLast()
                        
                    }
                }
            }
        }
        
    }
    
    func populateNil() {
        for i in (0...(self.mapSize - 1)) {
            mapMatrix.append([Place]())
            for _ in (0...(self.mapSize - 1)) {
                mapMatrix[i].append(nil)

            }
        }
    }
    
    func randomizeSafe() {
        let randomBorder = Int.random(in: 0...3)
        
        var position = Position()
        
        switch randomBorder {
        case 0: position.x = Int.random(in: 0...(self.mapSize - 1))
                position.y = 0
            break
        case 1: position.x = 0
        position.y = Int.random(in: 0...(self.mapSize - 1))
            break
        case 2: position.x = Int.random(in: 0...(self.mapSize - 1))
        position.y = self.mapSize - 1
            break
        case 3: position.x = self.mapSize - 1
        position.y = Int.random(in: 0...(self.mapSize - 1))
            break
        default: self.mapMatrix[0][0] = Place(name: "Safe", imageName: "Safe", type: .safehouse)
            break
        }
        
        self.mapMatrix[position.x][position.y] = Place(name: "Safe", imageName: "Safe", type: .safehouse)
        
    }
    
	func createEmptyMap(size: Int){
		mapMatrix = [[]]
		for line in 0...size{
			for column in 0...size{
				mapMatrix[line][column] = Place(name: "", imageName: "", type: .empty)
			}
		}
	}
	
	// >>>---------> DIRECTION
    
}
