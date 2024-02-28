//
//  OnboardingContinueButtonComponentView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 28.02.24.
//

import SwiftUI

struct OnboardingContinueButtonComponentView: View {
    var body: some View {
        Button(action: /*@START_MENU_TOKEN@*/{}/*@END_MENU_TOKEN@*/, label: {
            Text("Continue")
                .frame(maxWidth: .infinity)
                .font(.title)
                .foregroundStyle(.white)
                .padding()
                .background(Color.red)
                .clipShape(RoundedRectangle(cornerRadius: 5))
        })
        .padding()
        .padding(.bottom)

    }
}

#Preview {
    OnboardingContinueButtonComponentView()
}
