//
//  PlayerStartInfoViewController.swift
//  Jogos!
//
//  Created by Kaz Born on 04/12/19.
//  Copyright © 2019 Kelvin Javorski Soares. All rights reserved.
//

import UIKit

class PlayerStartInfoViewController: BaseViewController {

	@IBOutlet weak var playerNameLabel: UILabel!
	@IBOutlet weak var alignmentLabel: UILabel!
	@IBOutlet weak var objectiveLabel: UILabel!
	@IBOutlet weak var objectsInfoLabel: UILabel!
	@IBOutlet weak var staticObjectInfoLabel: UILabel!
	
	var player : Player!
	
	func refreshInterface () {
		player = GameManager.shared.getNextPlayer()
		
		playerNameLabel.text = player.name
		
		// ALIGNMENT AND OBJECTIVE
		switch player.alignment {
		case .innocent:
			alignmentLabel.text = "A TOURIST"
			objectiveLabel.attributedText = GameManager.shared.getAttrStrObjective(objective: GameManager.shared.innocentObjective)
		case .murderer:
			alignmentLabel.text = "THE MURDERER"
			objectiveLabel.attributedText = GameManager.shared.getAttrStrObjective(objective: GameManager.shared.murdererObjective)
		}
		
		objectsInfoLabel.attributedText = GameManager.shared.getAttrStrUpdatedObj(obj: player.place)
		
		staticObjectInfoLabel.attributedText = GameManager.shared.getAttrStrSecondObject(firstObj: player.place, secondObj: player.secondPlace)
	}
	
	@IBAction func nextPlayer(_ sender: UIButton) {
		GameManager.shared.hasShownPlayerInfo()
		
		// Go to pass device screen
		/*
		if let vc = navigationController?.viewControllers.last(where: { $0.isKind(of: PassDeviceViewController.self) }) {
			self.navigationController?.popToViewController(vc, animated: true)
		} else {
			if let vc = storyboard?.instantiateViewController(identifier: "Pass Device") as? PassDeviceViewController {
				self.navigationController?.pushViewController(vc, animated: true)
			}
		}
*/
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
