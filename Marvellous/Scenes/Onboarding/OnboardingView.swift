//
//  OnboardingView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 28.02.24.
//

import SwiftUI

struct OnboardingView: View {
    var body: some View {
        TabView {
            FirstWelcomeView()
            Text("2")

        }
        .ignoresSafeArea()
        .tabViewStyle(.page)

    }
}

#Preview {
    OnboardingView()
}
