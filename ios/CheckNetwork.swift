//
//  CheckNetwork.swift
//  RNSwiftCheckNetwork
//
//  Created by DNA on 3/21/16.
//  Copyright © 2016 Facebook. All rights reserved.
//

import Foundation
import SystemConfiguration

@objc(CheckNetwork)
public class CheckNetwork: NSObject{
 @objc func isConnectedToNetwork(callback: (NSObject) ->()) -> Void {
    //var isConnected: Bool = false
    var zeroAddress = sockaddr_in()
    zeroAddress.sin_len = UInt8(sizeofValue(zeroAddress))
    zeroAddress.sin_family = sa_family_t(AF_INET)
    let defaultRouteReachability = withUnsafePointer(&zeroAddress) {
      SCNetworkReachabilityCreateWithAddress(nil, UnsafePointer($0))
    }
    var flags = SCNetworkReachabilityFlags()
    if !SCNetworkReachabilityGetFlags(defaultRouteReachability!, &flags) {
      print("false")
      //return false
      
      callback([ false ])
    }
    let isReachable = (flags.rawValue & UInt32(kSCNetworkFlagsReachable)) != 0
    let needsConnection = (flags.rawValue & UInt32(kSCNetworkFlagsConnectionRequired)) != 0
    //isConnected = (isReachable && !needsConnection)
    callback([ true ])
     print("true: ",isReachable && !needsConnection)
    //return (isReachable && !needsConnection)
  
  }
}