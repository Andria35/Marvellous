//
//  FourthWelcomeView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 28.02.24.
//

import SwiftUI

struct FourthWelcomeView: View {
    
    // MARK: - Properties
    var buttonTapped: () -> Void
    
    
    // MARK: - Body
    var body: some View {
        ZStack {
            MainBackgroundComponentView()
            VStack {
                ZStack(alignment: .bottom) {
                    OnboardingImageComponentView(imageName: "FourthWelcomeViewImage")
                    textVStack
                }
                ButtonComponentView(title: "Continue", action: buttonTapped, backgroundColor: .red)
                    .padding()
                    .padding(.bottom)
                Spacer()
            }
        }
    }
}

// MARK: - UI Components
extension FourthWelcomeView {
    // MARK: - TextVStack
    private var textVStack: some View {
        VStack(alignment: .center) {
            Text("Plans according to your")
            Text("needs at affordable")
            Text("prices")
        }
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(.white)
    }
}

// MARK: - Preview
#Preview {
    FourthWelcomeView(buttonTapped: {})
}
