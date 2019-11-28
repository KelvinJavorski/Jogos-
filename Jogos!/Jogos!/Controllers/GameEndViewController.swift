//
//  GameEndViewController.swift
//  Jogos!
//
//  Created by Kaz Born on 28/11/19.
//  Copyright © 2019 Kelvin Javorski Soares. All rights reserved.
//

import UIKit

class GameEndViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

       
    }
    

	@IBAction func mainMenu(_ sender: UIButton) {
		self.navigationController?.popToRootViewController(animated: true)
	}
	

}
