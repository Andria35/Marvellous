//
//  OnboardingImageComponentView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 28.02.24.
//

import SwiftUI

struct OnboardingImageComponentView: View {
    
    let imageName: String
    
    var body: some View {
        ZStack {
            Image(imageName)
                .resizable()
            Image("MarvelLogo")
        }
        .ignoresSafeArea()
    }
}

#Preview {
    OnboardingImageComponentView(imageName: "FirstWelcomeView")
}
