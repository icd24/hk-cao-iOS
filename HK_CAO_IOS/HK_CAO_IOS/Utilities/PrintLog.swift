//
//  PrintLog.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 26/06/2024.
//

import Foundation

// create singleton class with log function and debug key
class PrintLog {
    
    static func log(message: String) {
        #if DEBUG
            print(message)
        #endif
    }
}
