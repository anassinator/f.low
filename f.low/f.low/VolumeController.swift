//
//  VolumeController.swift
//  f.low
//
//  Created by Anass Al-Wohoush on 2016-02-20.
//  Copyright © 2016 Owen Li. All rights reserved.
//

import AudioToolbox

class VolumeController {
    func getOutputDevice() -> AudioDeviceID {
        // Set up device ID.
        var deviceID = AudioDeviceID(0)
        var deviceIDSize = UInt32(sizeofValue(deviceID))

        // Get address of default audio device property.
        var propertyAddress = AudioObjectPropertyAddress(
            mSelector: AudioObjectPropertySelector(
                kAudioHardwarePropertyDefaultOutputDevice),
            mScope: AudioObjectPropertyScope(kAudioObjectPropertyScopeGlobal),
            mElement: AudioObjectPropertyElement(
                kAudioObjectPropertyElementMaster))

        // Get default audio device ID.
        let error = AudioObjectGetPropertyData(
            AudioObjectID(kAudioObjectSystemObject),
            &propertyAddress,
            0,
            nil,
            &deviceIDSize,
            &deviceID)

        // Check for error in getting device ID.
        if (error != 0) {
            NSLog("Could not find default output device")
        }

        return deviceID
    }
  
    func getVolumeProperyAddress() -> AudioObjectPropertyAddress {
        // Get address of master volume property.
        return AudioObjectPropertyAddress(
            mSelector: AudioObjectPropertySelector(
                kAudioHardwareServiceDeviceProperty_VirtualMasterVolume),
            mScope: AudioObjectPropertyScope(kAudioDevicePropertyScopeOutput),
            mElement: AudioObjectPropertyElement(
                kAudioObjectPropertyElementMaster))
    }

    func getVolume() -> Float32 {
        // Get output device ID.
        let deviceID = getOutputDevice()

        // Set up pointer to store volume and pointer to store size.
        let volumePtr = UnsafeMutablePointer<Void>.alloc(1)
        let volumeSize = UnsafeMutablePointer<UInt32>.alloc(1)
        volumeSize.memory = UInt32(sizeof(Float32))

        // Get address of volume property.
        var propertyAddress = getVolumeProperyAddress()

        // Get volume property data.
        let error = AudioHardwareServiceGetPropertyData(
            deviceID,
            &propertyAddress,
            0,
            nil,
            volumeSize,
            volumePtr)
      
        // Unwrap volume as Float32.
        let volume = UnsafeMutablePointer<Float32>(volumePtr).memory

        // Deallocate memory as necessary.
        volumePtr.dealloc(1)
        volumeSize.dealloc(1)

        // Check for error in getting volume.
        if (error != 0) {
            NSLog("Could not get volume of device")
            return Float32(0)
        }

        // Check for bounds.
        if (volume < 0 || volume > 1) {
            return Float32(0)
        }

        return volume
    }

    func setVolume(vol: Float32) {
        // Get output device ID.
        let deviceID = getOutputDevice()

        // Set up volume.
        var volume = Float32(vol)
        let volumeSize = UInt32(sizeofValue(volume))

        // Get address of volume property.
        var propertyAddress = getVolumeProperyAddress()

        // Set volume property data.
        let error = AudioHardwareServiceSetPropertyData(
            deviceID,
            &propertyAddress,
            0,
            nil,
            volumeSize,
            &volume)

        // Check for error in setting volume.
        if (error != 0) {
            NSLog("Could not set volume of device")
        }
    }
}