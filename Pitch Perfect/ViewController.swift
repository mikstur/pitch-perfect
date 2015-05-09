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
        
    }

    @IBAction func stopRecordingAudio(sender: UIButton) {
        
    }
}

