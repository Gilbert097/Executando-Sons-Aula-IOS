//
//  ViewController.swift
//  Executando Sons Aula
//
//  Created by Gilberto Silva on 04/04/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, AVAudioPlayerDelegate {
    
    private var player = AVAudioPlayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initializeAudioPlayer()
    }
    
    private func initializeAudioPlayer() {
        guard
            let path = Bundle.main.path(forResource: "bach", ofType: "mp3")
        else { return }
        let url = URL(fileURLWithPath: path)
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.delegate = self
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }

    @IBAction func playButtonClick(_ sender: UIButton) {
        player.prepareToPlay()
        player.play()
    }
    
    @IBAction func pauseButtonClick(_ sender: UIButton) {
        player.pause()
    }
    
    @IBAction func stopButtonClick(_ sender: UIButton) {
        player.stop()
        player.currentTime = 0
    }
    
    
}

