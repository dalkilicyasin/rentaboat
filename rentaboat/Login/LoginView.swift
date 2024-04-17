//
//  LoginView.swift
//  rentaboat
//
//  Created by yasin on 5.04.2024.
//

import SwiftUI
import FirebaseAuth
import GoogleSignIn
import Firebase

struct LoginView: View {
    @State var username: String = ""
    @State var password: String = ""
    @Binding var selectedItem: SelectedTab
    
    var body: some View {
        VStack {
            LoginHeader()
                .padding(.bottom)
            
            CustomTextfield(text: $username)
            
            CustomTextfield(text: $username)
            
            HStack {
                Spacer()
                Button(action: {}) {
                    Text("Forgot Password?")
                }
            }
            .padding(.trailing, 24)
            
            CustomButton()
            
            
            Text("or")
                .padding()
            
            GoogleButton {
                guard let clientID = FirebaseApp.app()?.options.clientID else { return }

                // Create Google Sign In configuration object.
                let config = GIDConfiguration(clientID: clientID)
                GIDSignIn.sharedInstance.configuration = config

                // Start the sign in flow!
                GIDSignIn.sharedInstance.signIn(withPresenting: getRootViewController()) { result, error in
                    
                  guard error == nil else {
                   return
                  }

                  guard let user = result?.user,
                    let idToken = user.idToken?.tokenString
                  else {
                    return
                  }

                  let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                                 accessToken: user.accessToken.tokenString)
                    
                    Auth.auth().signIn(with: credential) { result, error in
                        guard error == nil else {
                            
                            return
                        }
                    }
                  // ...
                }
            }
        }
       
    }
}

#Preview {
    LoginView( selectedItem: .constant(SelectedTab.profile))
}
