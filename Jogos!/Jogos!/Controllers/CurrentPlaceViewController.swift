//
//  CurrentPlaceViewController.swift
//  Jogos!
//
//  Created by Kaz Born on 28/11/19.
//  Copyright © 2019 Kelvin Javorski Soares. All rights reserved.
//

import UIKit

class CurrentPlaceViewController: UIViewController {

	func refreshInterface () {
		// RELOAD INFO THAT SHOWS ONSCREEN
		
	}
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		refreshInterface()
	}
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		refreshInterface()
	}
	
	@IBAction func north(_ sender: UIButton) {
		
		
	}
	
	@IBAction func south(_ sender: UIButton) {
		
		
	}
	
	@IBAction func west(_ sender: UIButton) {
		
		
	}
	
	@IBAction func east(_ sender: UIButton) {
		
		
	}
    
	@IBAction func passDevice(_ sender: UIButton) {
		if let vc = navigationController?.viewControllers.last(where: { $0.isKind(of: PassDeviceViewController.self) }) {
			self.navigationController?.popToViewController(vc, animated: true)
		} else  {
			if let vc = storyboard?.instantiateViewController(identifier: "Pass Device") as? PassDeviceViewController {
				self.navigationController?.pushViewController(vc, animated: true)
			}
		}
	}
	
	
	
}
