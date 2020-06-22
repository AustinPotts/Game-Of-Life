//
//  GameGridViewController.swift
//  Game-Of-Life-iOS
//
//  Created by Austin Potts on 6/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class GameGridViewController: UIViewController {

    //MARK:  - Outlets
    @IBOutlet var gameGrid: UICollectionView!
    @IBOutlet var playButton: UIButton!
    @IBOutlet var stepButton: UIButton!
    @IBOutlet var resetButton: UIButton!
    @IBOutlet var stopButton: UIButton!
    
    
    @IBOutlet var blinkerButton: UIButton!
    @IBOutlet var toadButton: UIButton!
    @IBOutlet var pulsarButton: UIButton!
    @IBOutlet var gliderButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        setUpViews()
    }
    

    func setUpViews(){
        
        //Grid Collec
        gameGrid.layer.borderWidth = 1
        gameGrid.layer.borderColor = UIColor.black.cgColor
        
        //Buttos
        playButton.layer.cornerRadius = 10
        stepButton.layer.cornerRadius = 10
        resetButton.layer.cornerRadius = 10
        stopButton.layer.cornerRadius = 10
        blinkerButton.layer.cornerRadius = 10
        toadButton.layer.cornerRadius = 10
        pulsarButton.layer.cornerRadius = 10
        gliderButton.layer.cornerRadius = 10
        
        
        
    }

}
