//
//  main.swift
//  GetAppleSerial
//
//  Created by kuban on 10/29/15.
//  Copyright © 2015 Zero Density. All rights reserved.
//

import Foundation

func GetAppleSerial() -> NSString {
    let platformExpert = IOServiceGetMatchingService(kIOMasterPortDefault, IOServiceMatching("IOPlatformExpertDevice"));
    
    if (platformExpert != 0) {
        let serialNumberAsCFString: Unmanaged<AnyObject> = IORegistryEntryCreateCFProperty(platformExpert,kIOPlatformSerialNumberKey, kCFAllocatorDefault, 0);
        let serialNumberAsString: String = serialNumberAsCFString.takeRetainedValue() as! String
        IOObjectRelease(platformExpert)
        return serialNumberAsString
    } else {
        return "NOAPPLESERIAL"
    }
}

print(GetAppleSerial())