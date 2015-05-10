//
//  RecordViewController.swift
//  Pitch Perfect
//
//  Created by Miki von Ketelhodt on 2015/05/09.
//  Copyright (c) 2015 RBG Apps. All rights reserved.
//

import UIKit
import AVFoundation

class RecordViewController: UIViewController {
    
    // Outlets connected to storyboard
    @IBOutlet weak var btnMicrophone: UIButton!
    @IBOutlet weak var lblRecording: UILabel!
    @IBOutlet weak var btnStop: UIButton!
    
    // Class member variables
    var audioRecorderManager: AudioRecorderManager!
    var recordedAudio: RecordedAudio!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        audioRecorderManager = AudioRecorderManager(delegate: self)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if (segue.identifier == Constants.StopRecordingSegue) {
            let playSoundsVC: PlaySoundsViewController = segue.destinationViewController as! PlaySoundsViewController
            let data = sender as! RecordedAudio
            playSoundsVC.recordedAudio = data
        }
    }
    
    func defaultUIState() {
        btnMicrophone.enabled = true
        btnStop.hidden = true
        lblRecording.text = "Tap the microphone to start recording your voice"
    }
    
    func recordingUIState() {
        btnMicrophone.enabled = false
        btnStop.hidden = false
        lblRecording.text = "Recording..."
    }

    @IBAction func startRecordingAudio(sender: UIButton) {
        recordingUIState()
        
        audioRecorderManager.startRecording()
    }

    @IBAction func stopRecordingAudio(sender: UIButton) {
        defaultUIState()
        
        audioRecorderManager.stopRecording()
    }
}

extension RecordViewController: AVAudioRecorderDelegate {
    
    func audioRecorderDidFinishRecording(recorder: AVAudioRecorder!, successfully flag: Bool) {
        if (flag) {
            recordedAudio = RecordedAudio()
            recordedAudio.URL = recorder.url
            recordedAudio.title = recorder.url.lastPathComponent
            
            self.performSegueWithIdentifier(Constants.StopRecordingSegue, sender: recordedAudio)
        } else {
            println("Recording failed!")
            btnMicrophone.enabled = true
            btnStop.hidden = true
            lblRecording.text = "Tap the microphone to start recording your voice"
        }
    }
    
}

