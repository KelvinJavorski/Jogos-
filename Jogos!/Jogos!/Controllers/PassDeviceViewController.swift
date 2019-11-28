//
//  PassDeviceViewController.swift
//  Jogos!
//
//  Created by Kaz Born on 28/11/19.
//  Copyright © 2019 Kelvin Javorski Soares. All rights reserved.
//

import UIKit

class PassDeviceViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        
    }
    

	@IBAction func inputPlayerName(_ sender: UIButton) {
		if let vc = storyboard?.instantiateViewController(identifier: "Input Player Name") as? InputPlayersNameViewController {
			self.navigationController?.pushViewController(vc, animated: true)
		}
	}
	
	@IBAction func currentPlace(_ sender: UIButton) {
		if let vc = storyboard?.instantiateViewController(identifier: "Current Place") as? CurrentPlaceViewController {
			self.navigationController?.pushViewController(vc, animated: true)
		}
	}
	
	@IBAction func gameEnd(_ sender: UIButton) {
		if let vc = storyboard?.instantiateViewController(identifier: "Game End") as? GameEndViewController {
			self.navigationController?.pushViewController(vc, animated: true)
		}
	}
	

}
