//
//  ResetPasswordView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 12.03.24.
//

import SwiftUI

struct ResetPasswordView: View {
    
    @StateObject var viewModel: ResetPasswordViewModel
    
    var body: some View {
        ZStack {
            MainBackgroundComponentView()
            
            VStack {
                TextField("Email", text: $viewModel.emailTextFieldText)
                    .padding()
                    .background(Color.white)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                
                ButtonComponentView(title: "Reset Password", action: {}, backgroundColor: .red, isDisabled: viewModel.emailTextFieldText.isEmpty ? true : false)
                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ResetPasswordView(viewModel: ResetPasswordViewModel())
}
