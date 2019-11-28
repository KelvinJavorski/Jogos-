//
//  GameSetupViewController.swift
//  Jogos!
//
//  Created by Kaz Born on 28/11/19.
//  Copyright © 2019 Kelvin Javorski Soares. All rights reserved.
//

import UIKit

class GameSetupViewController: UIViewController {

	
	func refreshInterface () {
		// RELOAD INFO THAT SHOWS ONSCREEN
		
	}
	
    override func viewDidLoad() {
        super.viewDidLoad()

       refreshInterface()
    }
	
	override func viewDidAppear(_ animated: Bool) {
		super.viewDidAppear(animated)
		
		refreshInterface()
	}
    

	@IBAction func mainMenu(_ sender: UIButton) {
		self.navigationController?.popToRootViewController(animated: <#T##Bool#>)
	}
	
	@IBAction func startGame(_ sender: UIButton) {
		if let vc = storyboard?.instantiateViewController(identifier: "Input Player Name") as? InputPlayersNameViewController {
			self.navigationController?.pushViewController(vc, animated: true)
		}
	}
	
	
	
}
