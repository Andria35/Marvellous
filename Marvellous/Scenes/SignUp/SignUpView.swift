//
//  SignUpView.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 29.02.24.
//

import SwiftUI

struct SignUpView: View {
    
    @State var password: String = ""
    
    var body: some View {
        ZStack {
            MainBackgroundComponentView()
            
            VStack {
                Image("MarvelLogo")
                    .padding()
                
                TextField("Email", text: $password)
                    .padding()
                    .background(Color.white)
                    .foregroundStyle(.gray)
                    .fontWeight(.bold)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                
                TextField("Password", text: $password)
                    .padding()
                    .background(Color.white)
                    .foregroundStyle(.gray)
                    .fontWeight(.bold)
                    .clipShape(RoundedRectangle(cornerRadius: 5))
                
                ButtonComponentView(title: "SignUp", action: {}, backgroundColor: .red)
                    .padding(.top)
                                
                Text("Forgot Password?")
                    .foregroundStyle(.white.opacity(0.5))
                    .font(.title3)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
//                Spacer()
                
                Text("Or")
                    .foregroundStyle(.white.opacity(0.5))
                    .font(.title3)
                    .padding()
                
                Text("Continue With")
                    .foregroundStyle(.white.opacity(0.9))
                    .fontWeight(.bold)
                    .font(.title3)
                
                Image("GoogleLogo")
                    .padding()
                    .background(Color.white.opacity(0.9))
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                
                Spacer()
                
                HStack {
                    Text("Already have an account?")
                        .foregroundStyle(.white.opacity(0.5))
                        .font(.title3)
                    Text("Login")
                        .font(.title3)
                        .foregroundStyle(.red)
                }
//                .padding(.top)
                Spacer()

            }
            .padding()
        }
    }
}

#Preview {
    SignUpView()
}
