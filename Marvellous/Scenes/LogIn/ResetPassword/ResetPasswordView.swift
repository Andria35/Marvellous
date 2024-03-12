//
//  ResetPasswordView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 12.03.24.
//

import SwiftUI

struct ResetPasswordView: View {
    
    // MARK: - Properties
    @StateObject var viewModel: ResetPasswordViewModel
    @Environment(\.dismiss) private var dismiss
    
    // MARK: - Body
    var body: some View {
        ZStack {
            MainBackgroundComponentView()
            
            VStack {
                TextField("Email", text: $viewModel.emailTextFieldText)
                    .padding()
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                
                ButtonComponentView(title: "Reset Password", action: {
                    viewModel.resetPassword()
                    dismiss()
                }, backgroundColor: .red, isDisabled: viewModel.emailTextFieldText.isEmpty ? true : false)
                
                Spacer()
            }
            .padding()
        }
    }
}

// MARK: - Preview
#Preview {
    ResetPasswordView(viewModel: ResetPasswordViewModel(authenticationManager: AuthenticationManager()))
}
