//
//  PassDeviceViewController.swift
//  Jogos!
//
//  Created by Kaz Born on 28/11/19.
//  Copyright © 2019 Kelvin Javorski Soares. All rights reserved.
//

import UIKit

class PassDeviceViewController: DarkBaseViewController {

	@IBOutlet weak var label: UILabel!
	@IBOutlet weak var bottomLabel: UILabel!
	var player : Player!
	
	func refreshInterface () {
		// RELOAD INFO THAT SHOWS ONSCREEN
		
		switch GameManager.shared.gameState {
		case .ended:
			label.attributedText = makeAttrStr(normalStr: "Put device on the\n", boldStr: "TABLE")
			
			bottomLabel.attributedText = makeAttrStr(normalStr: "Hold here if\nthe device is\n", boldStr: "ON THE TABLE")
		default:
			player = GameManager.shared.getNextPlayer()
			
			label.attributedText = makeAttrStr(normalStr: "Pass the device to\n", boldStr: player.name)
			
			bottomLabel.attributedText = makeAttrStr(normalStr: "Hold here if you are\n", boldStr: player.name)
		}
	}
	
	@IBAction func nextScreen(_ sender: UIButton) {
		switch GameManager.shared.gameState {
		case .initialInfo:
			if let vc = storyboard?.instantiateViewController(identifier: "Player Start Info") {
				self.navigationController?.pushViewController(vc, animated: true)
			}
		case .dayCycle:
			if let vc = storyboard?.instantiateViewController(identifier: "Current Place") as? CurrentPlaceViewController {
				self.navigationController?.pushViewController(vc, animated: true)
			}
		case .nightCycle:
			print("GO TO VOTING SCREEN")
		case .ended:
			if let vc = storyboard?.instantiateViewController(identifier: "Game End") {
				self.navigationController?.pushViewController(vc, animated: true)
			}
		default:
			print("ERROR: Switch in PassDeviceViewController > nextScreen()")
		}
	}
	
	
	func makeAttrStr (normalStr: String, boldStr: String) -> NSMutableAttributedString {
		let normalTextAtributes : [NSAttributedString.Key:Any] =
			[.backgroundColor: UIColor.init(white: 1.0, alpha: 0.0),
			 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 25.0, weight: .regular)]
		
		let boldTextAttributes : [NSAttributedString.Key:Any] =
			[.backgroundColor: UIColor.init(white: 1.0, alpha: 0.0),
			 NSAttributedString.Key.font: UIFont.systemFont(ofSize: 30.0, weight: .semibold)]
		
		let attrStr = NSMutableAttributedString(string: normalStr, attributes: normalTextAtributes)
		
		attrStr.append(NSAttributedString(string: boldStr, attributes: boldTextAttributes))
		
		return attrStr
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
