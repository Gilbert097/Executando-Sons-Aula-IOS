//
//  ViewController.swift
//  Executando Sons Aula
//
//  Created by Gilberto Silva on 04/04/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let path = Bundle.main.path(forResource: "bach", ofType: "mp3"){
            let url = URL(fileURLWithPath: path)
            
            do {
                player = try AVAudioPlayer(contentsOf: url)
                player.prepareToPlay()
                player.delegate = self
                player.play()
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }
    }


}

