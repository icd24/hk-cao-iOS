//
//  NetworkUtility.swift
//  jinzai
//
//  Created by HieuNV on 26/06/2024.
//

import Reachability

// swiftlint:disable force_try
class NetworkUtility {
    static let shared = NetworkUtility()

    private let reachability = try! Reachability()

    private init() {
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(networkChanged(_:)),
                                               name: .reachabilityChanged, object: reachability
        )
        try! reachability.startNotifier()
    }

    deinit {
        reachability.stopNotifier()
        NotificationCenter.default.removeObserver(self, name: .reachabilityChanged, object: nil)
    }
    
    @objc func networkChanged(_ notification: Notification) {
            if reachability.connection != .unavailable {
                
            } else {
            }
        }
    
    func isNetworkAvailable() -> Bool {
        return reachability.connection != .unavailable
    }
}
// swiftlint:enable force_try
