////
////  SetupViewController.swift
////  Jogos!
////
////  Created by Kelvin Javorski Soares on 27/11/19.
////  Copyright © 2019 Kelvin Javorski Soares. All rights reserved.
////
//
//import UIKit
//
//class SetupViewController: UIViewController {
//
//
//    @IBOutlet weak var confirmButton: UIButton!
//
//    var numberOfPlayers = 0
//    var currentNumber = 0
//    let picker = UIPickerView()
//    let toolBar = UIToolbar()
//
//
//    let availablePlayersOption = [3,4,5]
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        picker.delegate = self
//        picker.dataSource = self
//        createNumberOfPlayersPicker()
//        print(numberOfPlayers)
//
//        // Do any additional setup after loading the view.
//    }
//
//
//
//    @IBAction func setNumberOfPlayers(_ sender: Any){
//        print(numberOfPlayers)
////        performSegue(withIdentifier: "InputPlayersName", sender: nil)
//    }
//
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "InputPlayersName"{
//            let vc = segue.destination as! InputPlayersNameViewController
//            vc.numberOfPlayers = numberOfPlayers
//        }
//    }
//
//
//
//}
//
////MARK: UIPickerView
//
