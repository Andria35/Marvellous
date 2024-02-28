//
//  ThirdWelcomeView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 28.02.24.
//

import SwiftUI

struct ThirdWelcomeView: View {
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.black
            VStack {
                ZStack(alignment: .bottom) {
                    OnboardingImageComponentView(imageName: "ThirdWelcomeView")
                    textVStack
                }
                OnboardingContinueButtonComponentView()
                Spacer()
            }
        }
        .ignoresSafeArea()
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
    ThirdWelcomeView()
}
