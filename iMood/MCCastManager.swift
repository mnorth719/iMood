//
//  MCCastManager.swift
//  MattCast
//
//  Created by Matt  North on 6/17/16.
//  Copyright © 2016 MMN. All rights reserved.
//

import Foundation
import GoogleCast

public protocol MCCastManagerDelegate: class {
    func availableDevicesUpdated(devices: Set<GCKDevice>)
    func deviceConnected(device: GCKDevice)
    func deviceDisconnected(device: GCKDevice)
}

public class MCCastManager: NSObject, GCKDeviceScannerListener, GCKDeviceManagerDelegate,
                                GCKMediaControlChannelDelegate {
    
    private var applicationMetadata: GCKApplicationMetadata?
    private var deviceManager: GCKDeviceManager?
    private var mediaInformation: GCKMediaInformation?
    private var mediaControlChannel: GCKMediaControlChannel?
    private var deviceScanner: GCKDeviceScanner
    public var availableDevices: Set<GCKDevice>!
    public weak var delegate: MCCastManagerDelegate?
    
    public var connectedDevice: GCKDevice? {
        
        if (deviceManager == nil) {
            return nil;
        }
        
        switch deviceManager!.connectionState {
        case .Connected:
            return deviceManager?.device
        default:
            return nil;
        }
    }
    
    override init () {
        let filterCriteria = GCKFilterCriteria(forAvailableApplicationWithID:
            kGCKMediaDefaultReceiverApplicationID)
        deviceScanner = GCKDeviceScanner(filterCriteria:filterCriteria)
        availableDevices = Set();
        super.init()
    }
    
    func initializeScanner (){
        deviceScanner.addListener(self)
        deviceScanner.passiveScan = true
        availableDevices = []
    }
    
    public func beginScanningForDevices (){
        initializeScanner()
        deviceScanner.passiveScan = false
        deviceScanner.startScan()
    }
    
    public func connectToDevice(device: GCKDevice!) {
        //make sure this device is still in our list of available devices
        
        if (availableDevices.contains(device)) {
            let identifier = NSBundle.mainBundle().bundleIdentifier
            deviceManager = GCKDeviceManager(device: device, clientPackageName: identifier)
            deviceManager!.delegate = self
            deviceManager!.connect()
        }else{
            //display error that says device is no longer available
        }
        
    }
    
    // MARK: GC Device/Manager Delegate
    
    public func deviceDidComeOnline(device: GCKDevice!) {
        availableDevices.insert(device)
        delegate?.availableDevicesUpdated(availableDevices)
    }
    
    public func deviceDidGoOffline(device: GCKDevice!) {
        availableDevices.remove(device)
        delegate?.availableDevicesUpdated(availableDevices)
    }
    
    public func deviceManagerDidConnect(deviceManager: GCKDeviceManager!) {
        delegate?.deviceConnected(self.connectedDevice!)
    }
    
    
    public func deviceManager(deviceManager: GCKDeviceManager!, didDisconnectWithError error: NSError!) {
        //handle error
        // implement retry logic
        delegate?.deviceDisconnected(self.connectedDevice!)
    }
    
    public func streamImage(image: UIImage) {
        if (connectedDevice != nil) {
            
        }else{
            //error
        }
    }

    
}
