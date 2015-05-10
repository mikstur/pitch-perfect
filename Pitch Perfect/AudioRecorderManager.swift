//
//  AudioRecorderManager.swift
//  Pitch Perfect
//
//  Created by Miki von Ketelhodt on 2015/05/10.
//  Copyright (c) 2015 RBG Apps. All rights reserved.
//

import Foundation
import AVFoundation

class AudioRecorderManager: NSObject {
    
    var audioRecorder: AVAudioRecorder!
    
    var error: NSError?
    
    init(delegate: AVAudioRecorderDelegate) {
        audioRecorder = AVAudioRecorder(URL: AudioRecorderManager.generateUniqueWAVFilePath(), settings: nil, error: &error)
        audioRecorder.delegate = delegate
    }
    
    func startRecording() {
        var session = AVAudioSession.sharedInstance()
        session.setCategory(AVAudioSessionCategoryPlayAndRecord, error: &error)
        
        audioRecorder.meteringEnabled = true
        audioRecorder.record()
    }
    
    func stopRecording() {
        audioRecorder.stop()
        audioRecorder.meteringEnabled = false
        
        var audioSession = AVAudioSession.sharedInstance()
        audioSession.setActive(false, error: &error)
    }
    
    static func generateUniqueWAVFilePath() -> NSURL? {
        let dirPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as! String
        
        let currentDateTime = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateFormat = "ddMMyyyy-HHmmss"
        let recordingName = formatter.stringFromDate(currentDateTime) + ".wav"
        
        let pathArray = [dirPath, recordingName]
        return NSURL.fileURLWithPathComponents(pathArray)
    }
    
}