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
    
    // MARK: - Body
    var body: some View {
        Button(action: {
            withAnimation {
                action()
            }
        }, label: {
            Text(title)
                .frame(maxWidth: .infinity)
                .font(.title)
                .foregroundStyle(.white)
                .padding()
                .background(backgroundColor == nil ? .black : backgroundColor )
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .border(backgroundColor == nil ? .red : .clear, width: 4)
        })
    }
}

// MARK: - Preview
#Preview {
    ZStack {
        Color.black
            .ignoresSafeArea()
        ButtonComponentView(title: "Continue", action: {}, backgroundColor: nil)
    }
}
