//
//  RegisterViewModel.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/09.
//

import Foundation

class RegisterViewModel: ObservableObject {
    @Published var step: RegisterStep? = .EmailPassword
    // Email password screen
    @Published var email: String = ""
    @Published var password: String = ""
    @Published var emailError: String?
    @Published var passwordError: String?
    // Gender screen
    @Published var gender: Gender = .Unknown
    // Name input screen
    @Published var firstName: String = ""
    @Published var lastName: String = ""
    @Published var kanaFirstName: String = ""
    @Published var kanaLastName: String = ""
    @Published var firstNameError: String?
    @Published var lastNameError: String?
    @Published var kanaFirstNameError: String?
    @Published var kanaLastNameError: String?
    // Location screen
    @Published var portalCode1: String = ""
    @Published var portalCode2: String = ""
    @Published var prefecture: String = ""
    @Published var address: String = ""
    @Published var portalCodeError: String?
    @Published var prefectureError: String?
    @Published var addressError: String?
    // Phone screen
    @Published var phone: String = ""
    @Published var phoneError: String?
    // Birthday screen
    @Published var birthday: Date = Date()
    @Published var birthdayError: String?
    
    @Published var actionAvailable: Bool = true
    
    // MARK: - Email password screen
    func onRegisterEmailPassword() {
        guard actionAvailable else {
            return
        }
        
        guard validationEmailPassword() else {
            return
        }
        
        // TODO: Call api
        
        
        onNextStep()
    }
    func validationEmailPassword() -> Bool {
        emailError = Validation.validationEmail(email: email, fieldName: AppString.loginMailAddress)
        passwordError = Validation.validationPassword(password: password, fieldName: AppString.loginPassword)
        
        return emailError == nil && passwordError == nil
    }
    func onTermOfService() {
        AppState.shared.currentScreen = .termOfService
    }
    func onForgotPassword() {
        AppState.shared.currentScreen = .forgotPassword
    }
    
    // Gender screen
    // MARK: - Gender screen
    func onMaleSelect() {
        gender = .Male
        // TODO: Call api or store preference
        onNextStep()
    }
    func onFemaleSelect() {
        gender = .Female
        // TODO: Call api or store preference
        onNextStep()
    }
    
    // MARK: - Name screen
    func onRegisterName() {
        guard actionAvailable else {
            return
        }
        
        guard validateName() else {
            return
        }
        
        // TODO: Call api or store preference
        
        
        onNextStep()
    }
    
    func validateName() -> Bool {
        firstNameError = Validation.validationRequired(value: firstName, fieldName: AppString.registerNameFirst)
        lastNameError = Validation.validationRequired(value: lastName, fieldName: AppString.registerNameLast)
        kanaFirstNameError = Validation.validationRequired(value: kanaFirstName, fieldName: AppString.registerNameKanaFirst)
        kanaLastNameError = Validation.validationRequired(value: kanaLastName, fieldName: AppString.registerNameKanaLast)
        
        return firstNameError == nil && lastNameError == nil && kanaFirstNameError == nil && kanaLastNameError == nil
    }

    // MARK: - Location screen
    func onRegisterLocation() {
        guard actionAvailable else {
            return
        }
        
        guard validateLocation() else {
            return
        }
        
        // TODO: Call api or store preference
        
        onNextStep()
    }
    func validateLocation() -> Bool {
        portalCodeError = Validation.validationPortalCode(code: portalCode1, length: 3, fieldName: AppString.registerLocationPortalCode)
        if portalCodeError == nil {
            portalCodeError = Validation.validationPortalCode(code: portalCode2, length: 4, fieldName: AppString.registerLocationPortalCode)
        }
        
        prefectureError = Validation.validationRequired(value: prefecture, fieldName: AppString.registerLocationPrefecture)
        
        addressError = Validation.validationRequired(value: address, fieldName: AppString.registerLocationAddress)
        
        return portalCodeError == nil && prefectureError == nil && addressError == nil
    }
    
    // MARK: - Phone screen
    func onRegisterPhone() {
        guard actionAvailable else {
            return
        }
        
        guard validatePhone() else {
            return
        }
        
        // TODO: Call api or store preference
        
        onNextStep()
    }
    func validatePhone() -> Bool {
        phoneError = Validation.validationPhoneNumber(value: phone, fieldName: AppString.registerPhoneNumber)
        
        return phoneError == nil
    }
    
    // MARK: - Navigation
    func onBackStep() {
        switch step {
        case .EmailPassword:
            // Back to previous screen, after that remove 2 last record (this screen and last screen)
            AppState.shared.currentScreen = AppState.shared.flowScreenList.last ?? .splash
            AppState.shared.flowScreenList.removeLast(2)
        case .Gender:
            step = .EmailPassword
        case .Name:
            step = .Gender
        case .Location:
            step = .Name
        case .Phone:
            step = .Location
        case .Birthday:
            step = .Phone
        case .Study:
            step = .Birthday
        case .Car:
            step = .Study
        case .none:
            break
        }
    }

    func onNextStep() {
        switch step {
        case .EmailPassword:
            step = .Gender
        case .Gender:
            step = .Name
        case .Name:
            step = .Location
        case .Location:
            step = .Phone
        case .Phone:
            step = .Birthday
        case .Birthday:
            step = .Study
        case .Study:
            step = .Car
        case .Car:
            // TODO: finish register/ go to next step (work history)
            break
        case .none:
            break
        }

    }
}

enum RegisterStep: Int {
    case EmailPassword
    case Gender
    case Name
    case Location
    case Phone
    case Birthday
    case Study
    case Car
}
