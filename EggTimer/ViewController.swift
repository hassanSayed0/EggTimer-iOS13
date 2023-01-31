//
//  ViewController.swift
//  EggTimer
//
//  Created by Angela Yu on 08/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import AVFoundation
class ViewController: UIViewController {
    
    @IBOutlet weak var progressView: UIProgressView!
    let eggTimes = ["Soft":3.0 , "Medium":4.0 , "Hard": 7.0]
    var timer = Timer()
    var num: Float = 0.0
    var player : AVAudioPlayer!
    @IBAction func buttonPressed(_ sender: UIButton) {
        progressView.progress = 0
        timer.invalidate()
        num = Float (eggTimes[sender.currentTitle!]!)
         timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(timerAction), userInfo: nil, repeats: true)

    }
    @objc func timerAction( ) {
        progressView.progress += (1/num)
        if(progressView.progress == 1.0){
           
               
                let url = Bundle.main.url(forResource: "alarm_sound", withExtension: "mp3")!
                player = try! AVAudioPlayer(contentsOf: url)
                player.play()
            
            timer.invalidate()
        }
    }

}
