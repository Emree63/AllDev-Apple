//
//  FriendView.swift
//  AllIn
//
//  Created by étudiant on 27/09/2023.
//

import SwiftUI

struct Friend: View {
    
    var image: String
    var pseudo: String
    var body: some View {
        HStack{
            AsyncImage(url: URL(string: image))
                .frame(width: 50, height: 50)
                .cornerRadius(180)
                .scaledToFit()
            Text(pseudo)
                .fontWeight(.medium)
                .padding(.leading, 5)
                .font(.system(size: 18))
                .lineLimit(1)
            Spacer()
            Button("Supprimer") {}
                .frame(width: 90, height: 30)
                .foregroundColor(AllinColor.Gray_400)
                .font(.system(size: 14))
                .background(AllinColor.DeleteButtonColor)
                .cornerRadius(5)

        }
        .padding([.trailing,.leading], 25)
    }
}
