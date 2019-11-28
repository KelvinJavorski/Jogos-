//
//  SetupViewController.swift
//  Jogos!
//
//  Created by Kelvin Javorski Soares on 27/11/19.
//  Copyright © 2019 Kelvin Javorski Soares. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController {
    
    
    @IBOutlet weak var nameText : UITextField!
    @IBOutlet weak var confirmButton: UIButton!
    
    var numberOfPlayers = 0
    var currentNumber = 0
    let picker = UIPickerView()
    let toolBar = UIToolbar()
    
    
    let availablePlayersOption = [3,4,5]
    var players = [Player]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        createNumberOfPlayersPicker()
        picker.delegate = self
        picker.dataSource = self
        print(numberOfPlayers)
        
        // Do any additional setup after loading the view.
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        view.endEditing(true)
        super.touchesBegan(touches, with: event)
    }
    
    @IBAction func setNumberOfPlayers(_ sender: Any){
        print(numberOfPlayers)
    }
    
    @IBAction func createNewPlayerName(_ sender: Any){
        if(nameText.text != ""){
            players.append(Player(name: nameText.text!))
            nameText.text = ""
        }
        
        if (verifyMaxNumberWasReached()){
            print("Players names have been filled")
            //            performSegue(withIdentifier: <#T##String#>, sender: <#T##Any?#>)
        }
    }
    
    func verifyMaxNumberWasReached() -> Bool{
        if (players.count < numberOfPlayers){
            return false
        }
        return true
    }
    
}

//MARK: UIPickerView
extension SetupViewController : UIPickerViewDataSource, UIPickerViewDelegate{
    
    func createNumberOfPlayersPicker(){
        //        picker.backgroundColor = .white
        picker.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(picker)
        picker.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        picker.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        picker.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor).isActive = true
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return availablePlayersOption.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        numberOfPlayers = availablePlayersOption[row]
        return "\(availablePlayersOption[row])"
        
    }
}
