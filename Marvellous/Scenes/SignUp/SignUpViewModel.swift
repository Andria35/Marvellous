//
//  SignUpViewModel.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 02.03.24.
//

import Foundation
import FirebaseCore
import FirebaseAuth

final class SignUpViewModel: ObservableObject {
    
    @Published var email: String = ""
    @Published var password: String = ""
    
}
