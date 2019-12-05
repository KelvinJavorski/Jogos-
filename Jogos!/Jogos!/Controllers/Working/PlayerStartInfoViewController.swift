//
//  PlayerStartInfoViewController.swift
//  Jogos!
//
//  Created by Kaz Born on 04/12/19.
//  Copyright © 2019 Kelvin Javorski Soares. All rights reserved.
//

import UIKit

class PlayerStartInfoViewController: UIViewController {

	@IBOutlet weak var playerNameLabel: UILabel!
	@IBOutlet weak var alignmentLabel: UILabel!
	@IBOutlet weak var objectiveLabel: UILabel!
	@IBOutlet weak var objectsInfoLabel: UILabel!
	
	var player : Player!
	
	func refreshInterface () {
		player = GameManager.shared.getNextPlayer()
		
		playerNameLabel.text = player.name
		
		// ALIGNMENT AND OBJECTIVE
		switch player.alignment {
		case .innocent:
			alignmentLabel.text = "A TOURIST"
			objectiveLabel.attributedText = GameManager.shared.getAttrStrInnocentObjective()
		case .murderer:
			alignmentLabel.text = "THE MURDERER"
			
		}
		
		// OBSERVED OBJECT INFO
		
//		let firstObj = player.place.name
//		let distance = GameManager.map.distanceBetween(group, player.place)
//		let direction = GameManager.map.Directions(placePlayer: group, placeTarget: player.place)
//		let secondObj = player.secondPlace.name
//		let direction2 = player.directionToSecondPlace
		
//		objectsInfoLabel.attributtedText = GameManager.shared.getAttrStrObjects(firstObj: firstObj, distance: distance, direction: direction, secondObject: secondObj, direction2: direction2)
		
		
	}
	
	@IBAction func nextPlayer(_ sender: UIButton) {
		
		GameManager.shared.currentPlayer = GameManager.shared.getNextPlayer()
		
		if let vc = navigationController?.viewControllers.last(where: { $0.isKind(of: PassDeviceViewController.self) }) {
			self.navigationController?.popToViewController(vc, animated: true)
		} else {
			if let vc = storyboard?.instantiateViewController(identifier: "Pass Device") as? PassDeviceViewController {
				self.navigationController?.pushViewController(vc, animated: true)
			}
		}
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

        refreshInterface()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		refreshInterface()
	}
    

    

}
