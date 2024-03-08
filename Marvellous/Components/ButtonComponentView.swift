//
//  ButtonComponentView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 28.02.24.
//

import SwiftUI

struct ButtonComponentView: View {
    
    // MARK: - Properties
    let title: String
    var action: () -> Void
    let backgroundColor: Color?
    let isDisabled: Bool
    // MARK: - Body
    var body: some View {
        Button(action: {
            action()
        }, label: {
            Text(title)
                .frame(maxWidth: .infinity)
                .font(.title)
                .foregroundStyle(.white)
                .padding()
                .background(backgroundColor == nil ? .black : backgroundColor )
                .border(backgroundColor == nil ? .red : .clear, width: 4)
                .clipShape(RoundedRectangle(cornerRadius: 5))
        })
        .disabled(isDisabled)

    }
}

// MARK: - Preview
#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        ButtonComponentView(title: "Continue", action: {}, backgroundColor: nil, isDisabled: false)
    }
}
