//
//  OnboardingView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 28.02.24.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: - Body
    var body: some View {
        TabView {
            FirstWelcomeView()
            SecondWelcomeView()
            ThirdWelcomeView()
            FourthWelcomeView()

        }
        .ignoresSafeArea()
        .tabViewStyle(.page)

    }
}

// MARK: - Preview
#Preview {
    OnboardingView()
}
