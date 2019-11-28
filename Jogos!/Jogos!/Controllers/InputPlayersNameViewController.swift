//
//  InputPlayersNameViewController.swift
//  Jogos!
//
//  Created by Kaz Born on 28/11/19.
//  Copyright © 2019 Kelvin Javorski Soares. All rights reserved.
//

import UIKit

class InputPlayersNameViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
		
        
    }
    

	@IBAction func passDevice(_ sender: UIButton) {
		if let vc = storyboard?.instantiateViewController(identifier: "Pass Device") as? PassDeviceViewController {
			self.navigationController?.pushViewController(vc, animated: true)
		}
	}
	

}
