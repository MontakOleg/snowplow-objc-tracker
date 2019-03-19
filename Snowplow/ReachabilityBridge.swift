//
//  ReachabilityBridge.swift
//  Snowplow
//
//  Created by Michael Hadam on 12/18/18.
//  Copyright © 2018 Snowplow Analytics. All rights reserved.
//

import Foundation
import Reachability

@objc public class ReachabilityBridge: NSObject {

    @objc static public func connectionType() -> String {
        let status = currentNetworkStatus()

        switch status {
        case .ReachableViaWWAN:
            return "mobile"
        case .ReachableViaWiFi:
            return "wifi"
        case .NotReachable:
            return "offline"
        }
    }

    @objc static public func isOnline() -> Bool {
        return currentNetworkStatus() != .NotReachable
    }

    private static func currentNetworkStatus() -> NetworkStatus {
        let reachability = Reachability.forInternetConnection()
        return reachability?.currentReachabilityStatus() ?? .NotReachable
    }
}
