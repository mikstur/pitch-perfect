//
//  PlaySoundsViewController.swift
//  Pitch Perfect
//
//  Created by Miki von Ketelhodt on 2015/05/09.
//  Copyright (c) 2015 RBG Apps. All rights reserved.
//

import UIKit
import AVFoundation

class PlaySoundsViewController: UIViewController {
    
    // Outlet connections
    @IBOutlet weak var btnSlow: UIButton!
    @IBOutlet weak var btnFast: UIButton!
    @IBOutlet weak var btnChipmunk: UIButton!
    @IBOutlet weak var btnDarthVadar: UIButton!
    @IBOutlet weak var btnStop: UIButton!
    
    // Class variables
    var audioPlayerManager: AudioPlayerManager!
    var recordedAudio: RecordedAudio!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Instantiate audioPlayerManager, which manages the audio playback
        audioPlayerManager = AudioPlayerManager(fileURL: recordedAudio.URL)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func playSoundSlowly(sender: UIButton) {
        audioPlayerManager.playAudioWithVariableRate(0.5)
    }

    @IBAction func playSoundFast(sender: UIButton) {
        audioPlayerManager.playAudioWithVariableRate(2)
    }
    
    @IBAction func playSoundAsChipmunk(sender: UIButton) {
        audioPlayerManager.playAudioWithVariablePitch(1000)
    }
    
    @IBAction func playSoundAsDarthvadar(sender: UIButton) {
        audioPlayerManager.playAudioWithVariablePitch(-1000)
    }
    
    @IBAction func stopPlayingSound(sender: UIButton) {
        audioPlayerManager.stopAndReset()
    }
    
}
