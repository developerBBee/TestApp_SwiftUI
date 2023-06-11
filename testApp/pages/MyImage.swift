//
//  MyImage.swift
//  testApp
//
//  Created by ak on 2023/06/11.
//

import SwiftUI

struct MyImage: View {
    @Environment(\.dismiss) var dismiss
    @State var count = 0
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Image("pcmitsumori_app")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                Spacer()
                Button(action: {dismiss()}, label: {Text("back")})
            }
        }
    }
}
