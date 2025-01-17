//
//  userPicture.swift
//  AllIn
//
//  Created by Lucas Delanier on 04/06/2024.
//

import SwiftUI
struct UserPicture: View {
    var picture: String?
    var username: String
    var size: CGFloat
    
    var body: some View {
        ZStack {
            if let pictureURL = picture {
                userImage(url: pictureURL)
            } else {
                placeholderImage
            }
        }
    }
    
    @MainActor private func userImage(url: String) -> some View {
        AsyncCachedImage(url: URL(string: url)) { image in
            image
                .resizable()
                .frame(width: size, height: size)
                .clipShape(Circle())
                } placeholder: {
                    placeholderImage
                }
    }

    
    private var placeholderImage: some View {
        Circle()
            .foregroundColor(.gray)
            .frame(width: size, height: size)
            .overlay(
                Text(username.prefix(2).uppercased())
                    .fontWeight(.medium)
                    .foregroundStyle(.white)
                    .font(.system(size: fontSize(for: size)))
            )
    }
    
    private func fontSize(for diameter: CGFloat) -> CGFloat {
        let fontScaleFactor: CGFloat = 0.45
        return diameter * fontScaleFactor
    }
}

struct UserPicture_Previews: PreviewProvider {
    static var previews: some View {
        UserPicture(picture: nil, username: "Lucas", size: 100)
    }
}
