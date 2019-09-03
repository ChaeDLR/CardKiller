//
//  ViewController.swift
//  CardKiller
//
//  Created by Chae DeLaRosa on 4/7/19.
//  Copyright © 2019 EvilXenotree. All rights reserved.
//

import UIKit
import AVFoundation

class ViewController: UIViewController {
    
    
    @IBOutlet weak var leftImageView: UIImageView!
    
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var leftScoreLabel: UILabel!
    
    @IBOutlet weak var rightScoreLabel: UILabel!
    
    
    //Player anc CPU score Variable
    var leftScore = 0
    var rightScore = 0
    //Audio player Variable
    var backGroundPlayer = AVAudioPlayer()
    
    var musicStop = 2
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
        // Background music attempt number 2
    func playBackGroundMusic (fileNamed: String) {
        
        let url = Bundle.main.url(forResource: fileNamed, withExtension: nil)
        
        guard let newUrl = url else {
            
            print("Could not find filed called \(fileNamed)")
                return
        }
        do {
            backGroundPlayer = try AVAudioPlayer(contentsOf: newUrl)
            backGroundPlayer.numberOfLoops = -1
            backGroundPlayer.prepareToPlay()
            backGroundPlayer.play()
        }
        catch let error as NSError {
            
            print(error.description)
        }
    }
        
    
    
    @IBAction func dealTapped(_ sender: Any) {
        
        
       if musicStop == 2 {
       
            playBackGroundMusic(fileNamed: "Rick Astley - Never Gonna Shoot Your Stars.mp3")
            
            print("Enjoy your roll.")
       }
        
        
        let leftNumber = Int.random(in: 2...14)
        
        
        let rightNumber = Int.random(in: 2...14)
        
        
        leftImageView.image = UIImage(named: "card\(leftNumber)")
        
        rightImageView.image = UIImage(named: "card\(rightNumber)")
        
        if leftNumber > rightNumber {
            
            leftScore += 1
            
            leftScoreLabel.text = String(leftScore)
            
        } else if leftNumber < rightNumber {
            
            rightScore += 1
            
            rightScoreLabel.text = String(rightScore)
            
        } else {
            
        }
    
        
        musicStop += 2
        
        
    }

}
