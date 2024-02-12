//
//  LoginView.swift
//  iMovies
//
//  Created by cefalo on 31/1/24.
//

import SwiftUI
import FirebaseAuth

struct LoginView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    @ObservedObject private var authViewModel:AuthViewModel
    
    init(authViewModel: AuthViewModel) {
        self.authViewModel = authViewModel
    }
    
    
    var body: some View {
        ZStack {
            Color(.systemBackground)
            
            VStack {
                
                VStack (spacing: 24){
                    InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                        .textInputAutocapitalization(.none)
                    
                    InputView(text: $password, title: "Password", placeholder: "Enter your password",isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top,12)
                
                Button {
                    authViewModel.signIn(email: email, password: password)
                } label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.semibold)
                        Image(systemName:"arrow.right")
                    }.foregroundColor(.white)
                        .frame(width: UIScreen.main.bounds.width - 32, height: 48)
                }
                .background(Color(.systemBlue))
                .cornerRadius(10)
                .padding(.top,24)
            }
        }.alert(isPresented: $authViewModel.hasError) {
            Alert(title: Text(authViewModel.authError?.errorDescription ?? "Something went wrong!"),message: Text(authViewModel.authError?.recoverySuggestion ?? "Please try again later"),dismissButton: .default(Text("Okay")))
        }
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView(authViewModel: AuthViewModel(authService: FirebaseAuthService(authRepository: FirebaseAuthRepository(auth: Auth.auth()))))
    }
}

