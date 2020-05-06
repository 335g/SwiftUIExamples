//  Copyright © 2020 335g. All rights reserved.

import Foundation
import SwiftUI
import Combine

// MARK: - ViewModel

fileprivate final class ContentViewModel: ObservableObject {
    // input
    @Published var usernameEntered: String = ""
    @Published var passwordEntered: String = ""
    @Published var passwordEnteredAgain: String = ""
    
    // output
    @Published var validatedUsername: String? = nil
    @Published var validatedPassword: String? = nil
    @Published var canSubmit: Bool = false
    
    // input/output
    @Published var isChecking: Bool = false
    
    private var cancellables: [AnyCancellable] = []
    
    init() {
        // validatedUsername
        self.$usernameEntered
            .map { $0.isEmpty ? nil : .some($0) }
            .assign(to: \.validatedUsername, on: self)
            .store(in: &cancellables)
        
        // validatedPassword
        self.$passwordEntered
            .combineLatest(self.$passwordEnteredAgain)
            .map { (pass1, pass2) in
                pass1.count >= 8 && pass2.count >= 8 && pass1 == pass2
                    ? .some(pass1)
                    : nil
            }
            .assign(to: \.validatedPassword, on: self)
            .store(in: &cancellables)
        
        // canSubmit
        self.$validatedUsername
            .combineLatest(self.$validatedPassword)
            .map { $0.0 != nil && $0.1 != nil }
            .assign(to: \.canSubmit, on: self)
            .store(in: &cancellables)
    }
}

// MARK: - View

struct ContentView: View {
    @ObservedObject fileprivate var viewModel: ContentViewModel = .init()
    
    var body: some View {
        VStack {
            Group {
                TextField("username", text: $viewModel.usernameEntered)
                TextField("password", text: $viewModel.passwordEntered)
                TextField("confirmation password", text: $viewModel.passwordEnteredAgain)
            }
            .padding(.horizontal)
            .disabled(viewModel.isChecking)
            
            Button(action: self.wait) {
                Text("submit")
            }
            .padding(.top)
            .disabled(!viewModel.canSubmit)
        }
        .frame(minWidth: 300, idealWidth: 300, maxWidth: .infinity, minHeight: 150, idealHeight: 150, maxHeight: .infinity)
    }
    
    func wait() {
        self.viewModel.isChecking = true
        Thread.sleep(forTimeInterval: 2.0)
        self.viewModel.isChecking = false
    }
}

// MARK: - Preview (ContentView)

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
