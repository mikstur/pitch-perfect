//
//  ViewController.swift
//  Pitch Perfect
//
//  Created by Miki von Ketelhodt on 2015/05/09.
//  Copyright (c) 2015 RBG Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    // Outlets connected to storyboard
    @IBOutlet weak var btnMicrophone: UIButton!
    @IBOutlet weak var lblRecording: UILabel!
    @IBOutlet weak var btnStop: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func startRecordingAudio(sender: UIButton) {
        // Disable the record button so that the user does not accidentally hit it twice
        btnMicrophone.enabled = false
        
        // Show the stop button so that the user can stop recording and navigate to the next screen
        btnStop.hidden = false
        
        // Let the user know that we are currently recording
        lblRecording.text = "Recording..."
    }

    @IBAction func stopRecordingAudio(sender: UIButton) {
        // Return the text to default
        lblRecording.text = "Tap the microphone to start recording your voice"
    }
}

