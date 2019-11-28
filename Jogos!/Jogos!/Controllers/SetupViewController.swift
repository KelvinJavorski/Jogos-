//
//  SetupViewController.swift
//  Jogos!
//
//  Created by Kelvin Javorski Soares on 27/11/19.
//  Copyright © 2019 Kelvin Javorski Soares. All rights reserved.
//

import UIKit

class SetupViewController: UIViewController {
    
    
    @IBOutlet weak var confirmButton: UIButton!
    
    var numberOfPlayers = 0
    var currentNumber = 0
    let picker = UIPickerView()
    let toolBar = UIToolbar()
    
    
    let availablePlayersOption = [3,4,5]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        picker.delegate = self
        picker.dataSource = self
        createNumberOfPlayersPicker()
        print(numberOfPlayers)
        
        // Do any additional setup after loading the view.
    }
    

    
    @IBAction func setNumberOfPlayers(_ sender: Any){
        print(numberOfPlayers)
//        performSegue(withIdentifier: "InputPlayersName", sender: nil)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "InputPlayersName"{
            let vc = segue.destination as! InputPlayersNameViewController
            vc.numberOfPlayers = numberOfPlayers
        }
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
