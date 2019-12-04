//
//  InputPlayersNameViewController.swift
//  Jogos!
//
//  Created by Kelvin Javorski Soares on 28/11/19.
//  Copyright © 2019 Kelvin Javorski Soares. All rights reserved.
//

import UIKit

class InputPlayersNameViewController: UIViewController {
    
	// TEXTFIELDS OUTLETS
	var textFields : [UITextField] =  []
    @IBOutlet weak var player1TextField: UITextField!
	@IBOutlet weak var player2TextField: UITextField!
	@IBOutlet weak var player3TextField: UITextField!
	@IBOutlet weak var player4TextField: UITextField!
	@IBOutlet weak var player5TextField: UITextField!
	@IBOutlet weak var player6TextField: UITextField!
	@IBOutlet weak var player7TextField: UITextField!
	@IBOutlet weak var player8TextField: UITextField!
	
	// HAS PLAYER VIEWS
	var extraPlayerViews : [UIView] = []
	@IBOutlet weak var player5View: UIView!
	@IBOutlet weak var player6View: UIView!
	@IBOutlet weak var player7View: UIView!
	@IBOutlet weak var player8View: UIView!
	
	// ADD PLAYER VIEW
	@IBOutlet weak var addPlayerView: RoundedCornerView!
	
	var addConstraits : [NSLayoutConstraint] = []
	@IBOutlet weak var addPlayer5Constraint: NSLayoutConstraint!
	@IBOutlet weak var addPlayer6Constraint: NSLayoutConstraint!
	@IBOutlet weak var addPlayer7Constraint: NSLayoutConstraint!
	@IBOutlet weak var addPlayer8Constraint: NSLayoutConstraint!
	
	// REMOVE PLAYER VIEW
	@IBOutlet weak var removePlayerView: RoundedCornerView!
	
	var removeConstraints: [NSLayoutConstraint] = []
	@IBOutlet weak var removePlayer5Constraint: NSLayoutConstraint!
	@IBOutlet weak var removePlayer6Constraint: NSLayoutConstraint!
	@IBOutlet weak var removePlayer7Constraint: NSLayoutConstraint!
	@IBOutlet weak var removePlayer8Constraint: NSLayoutConstraint!
	
	var extraPlayers = 0
    
	func refreshInterface () { // RELOAD INFO ON THE SCREEN
		
		extraPlayers = 0
		
		for textField in textFields {
			textField.text = ""
			textField.placeholder = "Type the name of the player"
		}
		
		for playerView in extraPlayerViews {
			playerView.isHidden = true
		}
		
		updateButtonsPositions()
	}
	
	@IBAction func addPlayer(_ sender: UIButton) {
		extraPlayers += 1
		if extraPlayers > 4 { extraPlayers = 4 }
		updateButtonsPositions()
	}
	
	@IBAction func removePlayer(_ sender: UIButton) {
		extraPlayers -= 1
		if extraPlayers < 0 { extraPlayers = 0 }
		updateButtonsPositions()
	}
	
	@IBAction func startGame(_ sender: UIButton) {
		for i in 1 ... 4 + extraPlayers {
			if textFields[i].text != ""  {
				if let playerName = textFields[i].text {
					GameManager.shared.players.append(Player(name: playerName))
				}
			} else {
				let playerName = String(format: "Player %d", i)
				GameManager.shared.players.append(Player(name: playerName))
			}
		}
		
		passDevice()
	}
	
	private func updateButtonsPositions () {
		for playerView in extraPlayerViews {
			playerView.isHidden = true
		}
		
		for i in 0 ... extraPlayers {
			extraPlayerViews[i].isHidden = false
		}
		
		if extraPlayers != 0 {
			removePlayerView.isHidden = false
			
			for constraint in removeConstraints {
				constraint.priority = UILayoutPriority(rawValue: 1)
			}
			
			removeConstraints[extraPlayers - 1].priority = UILayoutPriority(rawValue: 1000)
		} else {
			removePlayerView.isHidden = true
		}
		
		if extraPlayers != 4 {
			addPlayerView.isHidden = false
			
			for constraint in addConstraits {
				constraint.priority = UILayoutPriority(rawValue: 1)
			}
			
			addConstraits[extraPlayers].priority = UILayoutPriority(rawValue: 1000)
		} else {
			addPlayerView.isHidden = true
		}
	}

	func passDevice() {
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
        
		textFields = [player1TextField, player2TextField, player3TextField, player4TextField, player5TextField, player6TextField, player7TextField, player8TextField]
		extraPlayerViews = [player5View, player6View, player7View, player8View]
		removeConstraints = [removePlayer5Constraint, removePlayer6Constraint, removePlayer7Constraint, removePlayer8Constraint]
		addConstraits = [addPlayer5Constraint, addPlayer6Constraint, addPlayer7Constraint, addPlayer8Constraint]
		
        refreshInterface()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        refreshInterface()
    }
	
	override func viewWillAppear(_ animated: Bool) {
		super.viewWillAppear(animated)
		
		refreshInterface()
	}
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
	
    
    
    
}

