//
//  VolumeMonitor.swift
//  f.low
//
//  Created by Owen Li on 2016-02-20.
//  Copyright © 2016 Owen Li. All rights reserved.
//


import Foundation
import AVFoundation
import CoreAudio



class VolumeMonitor: NSObject {
    
    var recorder: AVAudioRecorder!
    var levelTimer =  NSTimer()
    var lowPassResults: Double = 0.0
    var cb: ((Float32,Float32) -> Void)? = nil
    
    
    
    func start(cb: (Float32,Float32) -> Void) {
        
        self.cb = cb
        
        let documents: AnyObject = NSSearchPathForDirectoriesInDomains( NSSearchPathDirectory.DocumentDirectory,  NSSearchPathDomainMask.UserDomainMask, true)[0]
        let str =  documents.stringByAppendingPathComponent("recordTest.mp4")
        let url = NSURL.fileURLWithPath(str as String)
        
        let recordSettings = [AVSampleRateKey : NSNumber(float: Float(44100.0)),
            AVFormatIDKey : NSNumber(int: Int32(kAudioFormatMPEG4AAC)),
            AVNumberOfChannelsKey : NSNumber(int: 1),
            AVEncoderAudioQualityKey : NSNumber(int: Int32(AVAudioQuality.Medium.rawValue))]
        
        var error: NSError?
        
        do
        {
            recorder = try AVAudioRecorder(URL:url, settings:recordSettings)
        }
        catch let error as NSError
        {
            print(error.description)
        }
        if let e = error {
            print(e.localizedDescription)
        }
        else {
            recorder.prepareToRecord()
            recorder.meteringEnabled = true
            recorder.record()
            levelTimer = NSTimer.scheduledTimerWithTimeInterval(0.5, target: self, selector: "levelTimerCallback:", userInfo: nil, repeats: true)
            CFRunLoopRun()
        }
    }
    func levelTimerCallback(timer: NSTimer) {
        recorder.updateMeters()
        let average = recorder.averagePowerForChannel(0)
        let peak = recorder.peakPowerForChannel(0)
        if self.cb != nil {
            self.cb!(average,peak)
        }
    }

}

func cb2(average: Float32, peak : Float32) {
    print(average)
    print(peak)
}
