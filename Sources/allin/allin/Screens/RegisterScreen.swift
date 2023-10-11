//
//  RegisterScreen.swift
//  AllIn
//
//  Created by étudiant on 25/09/2023.
//

import SwiftUI

struct Register: View {
    
    @State private var isPasswordVisible = true
    @State private var username: String = ""
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordConfirm: String = ""
    @State private var isRegisterSuccessful = false

    var body: some View {
        GeometryReader { geometry in
            ScrollView(showsIndicators: false) {
                VStack(spacing: 15) {
                    Spacer()
                    VStack {
                        if (username != "") {
                            Text("Bonjour "+username+",")
                                .betTextStyle(weight: .semibold, color: AllinColor.StartTextColor, size: 40)
                                .padding([.trailing, .leading], 30)
                        } else {
                            Text("Bonjour,")
                                .betTextStyle(weight: .semibold, color: AllinColor.StartTextColor, size: 40)
                                .lineLimit(1)
                                .padding([.trailing, .leading], 30)
                        }
                        Text("On a besoin de ça!")
                            .betTextStyle(weight: .semibold, color: AllinColor.StartTextColor, size: 40)
                    }
                    
                    Text("Promis c’est rapide.")
                        .frame(width: 220)
                        .multilineTextAlignment(.center)
                        .betTextStyle(weight: .regular, color: AllinColor.StartTextColor, size: 20)
                        .padding(.bottom, 60)
                    
                    TextField("", text: $username, prompt: Text("Pseudo").foregroundColor(.gray))
                        .padding()
                        .background(Color.white.cornerRadius(9))
                        .frame(width: 300)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 9, style: .continuous)
                                .stroke(AllinColor.StrokeGrayColor, lineWidth: 1)
                        )
                        .padding(.bottom, 8)
                    
                    TextField("", text: $email, prompt: Text("Email").foregroundColor(.gray))
                        .padding()
                        .background(Color.white.cornerRadius(9))
                        .frame(width: 300)
                        .foregroundColor(.black)
                        .overlay(
                            RoundedRectangle(cornerRadius: 9, style: .continuous)
                                .stroke(AllinColor.StrokeGrayColor, lineWidth: 1)
                        )
                        .padding(.bottom, 8)
                    
                    Group {
                        if isPasswordVisible {
                            SecureField("", text: $password, prompt: Text("Mot de passe").foregroundColor(.gray))
                        } else {
                            TextField("", text: $password, prompt: Text("Mot de passe").foregroundColor(.gray))
                                .autocapitalization(.none)
                        }
                    }
                    .padding()
                    .background(Color.white.cornerRadius(9))
                    .frame(width: 300)
                    .overlay(
                        RoundedRectangle(cornerRadius: 9, style: .continuous)
                            .stroke(AllinColor.StrokeGrayColor, lineWidth: 1)
                    )
                    .foregroundColor(.black)
                    .padding(.bottom, 8)
                    .overlay(
                        HStack {
                            Spacer()
                            Button(action: {
                                isPasswordVisible.toggle()
                            }) {
                                Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                    .foregroundColor(.gray)
                            }
                            .padding(.bottom, 8)
                            .padding(.trailing, 8)
                        }
                    )
                    
                    Group {
                        if isPasswordVisible {
                            SecureField("", text: $passwordConfirm, prompt: Text("Confirmation du Mot de passe").foregroundColor(.gray))
                        } else {
                            TextField("", text: $passwordConfirm, prompt: Text("Confirmation du Mot de passe").foregroundColor(.gray))
                                .autocapitalization(.none)
                        }
                    }
                    .padding()
                    .background(Color.white.cornerRadius(9))
                    .frame(width: 300)
                    .overlay(
                        RoundedRectangle(cornerRadius: 9, style: .continuous)
                            .stroke(AllinColor.StrokeGrayColor, lineWidth: 1)
                    )
                    .overlay(
                        HStack {
                            Spacer()
                            Button(action: {
                                isPasswordVisible.toggle()
                            }) {
                                Image(systemName: isPasswordVisible ? "eye.slash" : "eye")
                                    .foregroundColor(.gray)
                            }
                            .padding(.trailing, 8)
                        }
                    )
                    .foregroundColor(.black)
                    .padding(.bottom, 50)
                    
                    Button(action: {
                        register(email: email, username: username, password: password)
                    }) {
                        Text("S'inscrire")
                            .betTextStyle(weight: .bold, color: .white, size: 17)
                    }
                    .frame(width: 300, height: 60)
                    .background(LinearGradient(gradient:
                                                Gradient(colors:[AllinColor.TopBarColorPink,AllinColor.TopBarColorPurple,AllinColor.TopBarColorBlue]),
                                               startPoint: .leading, endPoint: .trailing))
                    .background(
                        NavigationLink("", destination: Home(page: "Bet").navigationBarBackButtonHidden(true), isActive: $isRegisterSuccessful)
                            .opacity(0)
                    )
                    .cornerRadius(13)
                    
                    Spacer()
                    
                    HStack(spacing: 0) {
                        Text("Tu as déjà un compte? ")
                            .betTextStyle(weight: .regular, color: AllinColor.StartTextColor, size: 16)
                        NavigationLink(destination: Login().navigationBarBackButtonHidden(true))
                        {
                            Text("Se connecter")
                                .betTextStyle(weight: .semibold, color: AllinColor.PurpleText, size: 16)
                        }
                    }
                    
                }

            }
            .frame(width: geometry.size.width, height: geometry.size.height)
            .background(AllinColor.StartBackground)
        }
    }
    
    func register(email: String, username: String, password: String) {
        let api = AuthService()

        api.register(email: email, password: password, username: username) { statusCode in
            DispatchQueue.main.async {
                if statusCode == 201 {
                    isRegisterSuccessful = true
                } else {

                }
            }
        }
    }
    
}
