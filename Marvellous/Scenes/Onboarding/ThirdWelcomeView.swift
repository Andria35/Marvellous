//
//  ThirdWelcomeView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 28.02.24.
//

import SwiftUI

struct ThirdWelcomeView: View {
    
    // MARK: - Properties
    var buttonTapped: () -> Void
    
    // MARK: - Body
    var body: some View {
        ZStack {
            MainBackgroundComponentView()
            VStack {
                ZStack(alignment: .bottom) {
                    OnboardingImageComponentView(imageName: "ThirdWelcomeViewImage")
                    textVStack
                }
                
                ButtonComponentView(title: "Continue", action: buttonTapped, backgroundColor: .red, isDisabled: false)
                    .padding()
                    .padding(.bottom)
                Spacer()
            }
        }
    }
}

// MARK: - UI Components
extension ThirdWelcomeView {
    // MARK: - TextVStack
    private var textVStack: some View {
        VStack(alignment: .center) {
            Text("Create profiles for")
            Text("different members &")
            Text("get personalised")
            Text("recommendations")
        }
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(.white)
    }
}

// MARK: - Preview
#Preview {
    ThirdWelcomeView(buttonTapped: {})
}
