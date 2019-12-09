//
//  MoveGroupViewController.swift
//  Jogos!
//
//  Created by Kevin Ribeiro on 09/12/19.
//  Copyright © 2019 Kelvin Javorski Soares. All rights reserved.
//

import UIKit

class MoveGroupViewController: UIViewController {
    
    @IBOutlet weak var windRoseImage: UIImageView!
    
    @IBOutlet weak var Nbutton: UIButton!
    @IBOutlet weak var NEbutton: UIButton!
    @IBOutlet weak var Ebutton: UIButton!
    @IBOutlet weak var SEbutton: UIButton!
    @IBOutlet weak var Sbutton: UIButton!
    @IBOutlet weak var SWbutton: UIButton!
    @IBOutlet weak var Wbutton: UIButton!
    @IBOutlet weak var NWbutton: UIButton!
    
    @IBOutlet weak var chooseDirectionButton: UIButton!
    
    var positionFlag : Int = 0
    
    
    @IBAction func Naction(_ sender: Any) {
        positionFlag = 1
        alphaAllDirectionButtons()
        Nbutton.alpha = 1.0
    }
    @IBAction func NEaction(_ sender: Any) {
        positionFlag = 2
        alphaAllDirectionButtons()
        NEbutton.alpha = 1.0
    }
    @IBAction func Eaction(_ sender: Any) {
        positionFlag = 3
        alphaAllDirectionButtons()
        Ebutton.alpha = 1.0
    }
    @IBAction func SEaction(_ sender: Any) {
        positionFlag = 4
        alphaAllDirectionButtons()
        SEbutton.alpha = 1.0
    }
    @IBAction func Saction(_ sender: Any) {
        positionFlag = 5
        alphaAllDirectionButtons()
        Sbutton.alpha = 1.0
    }
    @IBAction func SWaction(_ sender: Any) {
        positionFlag = 6
        alphaAllDirectionButtons()
        SWbutton.alpha = 1.0
    }
    @IBAction func Waction(_ sender: Any) {
        positionFlag = 7
        alphaAllDirectionButtons()
        Wbutton.alpha = 1.0
    }
    @IBAction func NWaction(_ sender: Any) {
        positionFlag = 8
        alphaAllDirectionButtons()
        NWbutton.alpha = 1.0
    }
    
    @IBAction func chooseDirectionAction(_ sender: Any) {
        switch positionFlag {
        case 1: GameManager.shared.navigator.moveGroup(to: .north)
            break
        case 2: GameManager.shared.navigator.moveGroup(to: .northeast)
            break
        case 3: GameManager.shared.navigator.moveGroup(to: .east)
            break
        case 4: GameManager.shared.navigator.moveGroup(to: .southeast)
            break
        case 5: GameManager.shared.navigator.moveGroup(to: .south)
            break
        case 6: GameManager.shared.navigator.moveGroup(to: .southwest)
            break
        case 7: GameManager.shared.navigator.moveGroup(to: .west)
            break
        case 8: GameManager.shared.navigator.moveGroup(to: .northwest)
            break
        default: GameManager.shared.navigator.moveGroup(to: .on)
        }
    }
    //gamemaneger.shared.currentplayer
    
    func alphaAllDirectionButtons() {
        Nbutton.alpha = 0.5
        NEbutton.alpha = 0.5
        NWbutton.alpha = 0.5
        Sbutton.alpha = 0.5
        SEbutton.alpha = 0.5
        SWbutton.alpha = 0.5
        Ebutton.alpha = 0.5
        Wbutton.alpha = 0.5
    }
    
    override func viewDidLoad() {
        if GameManager.shared.currentPlayer.alignment == .innocent {
            Nbutton.alpha = 1.0
            NEbutton.alpha = 0.5
            NWbutton.alpha = 0.5
            Sbutton.alpha = 1.0
            SEbutton.alpha = 0.5
            SWbutton.alpha = 0.5
            Ebutton.alpha = 1.0
            Wbutton.alpha = 1.0
            
            NEbutton.isUserInteractionEnabled = false
            NWbutton.isUserInteractionEnabled = false
            SEbutton.isUserInteractionEnabled = false
            SWbutton.isUserInteractionEnabled = false
            
            windRoseImage.image = UIImage(named: "turista")
        }
        else if GameManager.shared.currentPlayer.alignment == .murderer{
            Nbutton.alpha = 1.0
            NEbutton.alpha = 1.0
            NWbutton.alpha = 1.0
            Sbutton.alpha = 1.0
            SEbutton.alpha = 1.0
            SWbutton.alpha = 1.0
            Ebutton.alpha = 1.0
            Wbutton.alpha = 1.0
            
            windRoseImage.image = UIImage(named: "assassino")
        }
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
