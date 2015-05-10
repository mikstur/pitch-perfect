//
//  AudioManager.swift
//  Pitch Perfect
//
//  Created by Miki von Ketelhodt on 2015/05/10.
//  Copyright (c) 2015 RBG Apps. All rights reserved.
//

import Foundation
import AVFoundation

class AudioPlayerManager: NSObject {
    
    var audioEngine: AVAudioEngine!
    var audioFile: AVAudioFile!
    var audioPlayerNode: AVAudioPlayerNode!
    var audioUnitTimePitch: AVAudioUnitTimePitch!
    
    var error: NSError?
    
    init(fileURL: NSURL) {
        audioEngine = AVAudioEngine()
        audioFile = AVAudioFile(forReading: fileURL, error: &error)
        
        audioPlayerNode = AVAudioPlayerNode()
        audioUnitTimePitch = AVAudioUnitTimePitch()
        
        audioEngine.attachNode(audioPlayerNode)
        audioEngine.attachNode(audioUnitTimePitch)
        
        audioEngine.connect(audioPlayerNode, to: audioUnitTimePitch, format: nil)
        audioEngine.connect(audioUnitTimePitch, to: audioEngine.outputNode, format: nil)
    }
    
    func stopAndReset() {
        audioPlayerNode.stop()
        
        audioPlayerNode.reset()
        audioUnitTimePitch.reset()
        audioEngine.reset()
        
        audioUnitTimePitch.pitch = 1.0
        audioUnitTimePitch.rate = 1.0
    }
    
    func playAudioWithVariablePitch(pitch: Float) {
        stopAndReset()
        
        audioUnitTimePitch.pitch = pitch
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(nil)
        audioPlayerNode.play()
    }
    
    func playAudioWithVariableRate(rate: Float) {
        stopAndReset()
        
        audioUnitTimePitch.rate = rate
        
        audioPlayerNode.scheduleFile(audioFile, atTime: nil, completionHandler: nil)
        audioEngine.startAndReturnError(&error)
        audioPlayerNode.play()
    }
    
}