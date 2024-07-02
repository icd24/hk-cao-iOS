//
//  LoginModel.swift
//  jinzai
//
//  Created by HieuNV on 26/06/2024.
//

import Foundation

class LoginModel: ObservableObject {
    @Published var username: String = ""
    @Published var password: String = ""
}
