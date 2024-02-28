//
//  FirstWelcomeView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 28.02.24.
//

import SwiftUI

struct FirstWelcomeView: View {
    
    // MARK: - Body
    var body: some View {
        ZStack {
            Color.black
            VStack {
                ZStack(alignment: .bottom) {
                    mainImageZStack
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
extension FirstWelcomeView {
    // MARK: - TextVStack
    private var textVStack: some View {
        VStack(alignment: .center) {
            Text("All your favourite")
            Text("MARVEL Movies & Series")
            Text("at one place")
        }
        .font(.title3)
        .fontWeight(.bold)
        .foregroundStyle(.white)
    }
    
    // MARK: - MainImageZStack
    private var mainImageZStack: some View {
        ZStack {
            Image("FirstWelcomeView")
                .resizable()
            Image("MarvelLogo")
        }
    }
}

#Preview {
    FirstWelcomeView()
}
