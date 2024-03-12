//
//  LogInViewModel.swift
//  Marvellous
//
//  Created by Andria Inasaridze on 12.03.24.
//

import Foundation

final class LogInViewModel: ObservableObject {
    
    // MARK: - Properties
    @Published var emailTextFieldText: String = ""
    @Published var passwordTextFieldText: String = ""
}
