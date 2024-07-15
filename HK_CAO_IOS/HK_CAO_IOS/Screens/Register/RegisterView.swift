//
//  RegisterView.swift
//  HK_CAO_IOS
//
//  Created by HieuNV on 2024/07/14.
//

import SwiftUI

struct RegisterView: View {
    @ObservedObject var viewModel: RegisterViewModel
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(
                    destination: Register_EmailPasswordView(
                        viewModel: viewModel
                    ).navigationBarHidden(true),
                    tag: RegisterStep.EmailPassword,
                    selection: $viewModel.step) {
                        EmptyView()
                    }
                NavigationLink(
                    destination: Register_GenderView(
                        viewModel: viewModel
                    ).navigationBarHidden(true),
                    tag: RegisterStep.Gender,
                    selection: $viewModel.step) {
                        EmptyView()
                    }
                NavigationLink(
                    destination: Register_NameView(
                        viewModel: viewModel
                    ).navigationBarHidden(true),
                    tag: RegisterStep.Name,
                    selection: $viewModel.step) {
                        EmptyView()
                    }
                NavigationLink(
                    destination: Register_LocationView(
                        viewModel: viewModel
                    ).navigationBarHidden(true),
                    tag: RegisterStep.Location,
                    selection: $viewModel.step) {
                        EmptyView()
                    }
                NavigationLink(
                    destination: Register_PhoneView(
                        viewModel: viewModel
                    ).navigationBarHidden(true),
                    tag: RegisterStep.Phone,
                    selection: $viewModel.step) {
                        EmptyView()
                    }
                NavigationLink(
                    destination: Register_BirthdayView(
                        viewModel: viewModel
                    ).navigationBarHidden(true),
                    tag: RegisterStep.Birthday,
                    selection: $viewModel.step) {
                        EmptyView()
                    }
                NavigationLink(
                    destination: Register_StudyView(
                        viewModel: viewModel
                    ).navigationBarHidden(true),
                    tag: RegisterStep.Study,
                    selection: $viewModel.step) {
                        EmptyView()
                    }
                NavigationLink(
                    destination: Register_CarView(
                        viewModel: viewModel
                    ).navigationBarHidden(true),
                    tag: RegisterStep.Car,
                    selection: $viewModel.step) {
                        EmptyView()
                    }
            }
            .navigationBarHidden(true)
        }
    }
}
#Preview {
    RegisterView(viewModel: RegisterViewModel())
}
