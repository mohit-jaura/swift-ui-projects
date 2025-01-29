//
//  LogoHeader.swift
//  PannuSwiftUi
//
//  Created by Mohit Soni on 13/12/24.
//


import SwiftUI

struct LogoHeader: View {
    var isLarge: Bool = false
    var body: some View {
        HStack(spacing: 12){
            BaseImageView(imageName: AppImages.pannuLogo)
                .frame(width: isLarge ? 74 : 54, height:isLarge ? 73 : 53)
                .clipShape(Circle())
            VStack(alignment: .leading){
                BaseTextView(text: "PANNU'S", textColor: .APP_PRIMARY, fontWeight: .bold, fontSize: isLarge ? 35 : 28)
                BaseTextView(text: "LEGAL SERVICES", fontWeight: .bold, fontSize: isLarge ? 20 : 14)
                    .offset(y:-5)
            }
        }
    }
}

#Preview {
    LogoHeader()
}
