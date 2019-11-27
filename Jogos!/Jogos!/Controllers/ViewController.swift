//
//  ViewController.swift
//  Jogos!
//
//  Created by Kelvin Javorski Soares on 21/11/19.
//  Copyright © 2019 Kelvin Javorski Soares. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        criaTabuleiro()
    }
    
    func criaTabuleiro(){
        var Map : [[Place]]
        let lin = 5
        let col = 5
        for linha in 0...lin{
            for coluna in 0...col{
                Map[lin][col] = Place(name: "", imageName: "", type: .empty)
            }
        }
    }
}
