//
//  Page1.swift
//  testApp
//
//  Created by ak on 2023/06/10.
//

import SwiftUI
import CoreData

struct CountUP: View {
    @Environment(\.dismiss) var dismiss
    @State var count = 0
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                Button(
                    action: {
                    count = count+1
                }){
                    Text("Count-up")
                }
                Spacer()
                Text("\(count)")
                Spacer()
                Button(action: {dismiss()}, label: {Text("back")})
            }
        }
    }
}

