//
//  CountUP.swift
//  testApp
//
//  Created by ak on 2023/06/10.
//

import SwiftUI

struct CountUP: View {
    @Environment(\.dismiss) var dismiss
    @ObservedObject var cd = CountData()
    @ObservedObject var t = MyTimer()
    @State var timerButtonText = "Timer Start"
    let countResetButtonText = "Count Reset"
    let timerResetButtonText = "Timer Reset"
    let monospaceFont = Font(UIFont.monospacedSystemFont(ofSize: 18.0, weight: .regular))
    var body: some View {
        NavigationView {
            VStack {
                Spacer()

                // Manual Counter
                Button(
                    action: {
                        cd.plusOneCount()
                }){
                    Text("Count-up")
                }.padding()
                Button(
                    action: {cd.resetCount()}
                ){
                    Text(countResetButtonText)
                }.padding()
                Text(cd.getCount()).font(monospaceFont)

                Spacer()

                // Timer
                Button(
                    action: {
                        if (t.timer == nil) {
                            t.start()
                            timerButtonText = "Timer Stop"
                        } else {
                            t.stop()
                            timerButtonText = "Timer Start"
                        }
                }){
                    Text(timerButtonText)
                }.padding()
                Button(
                    action: {
                        if (t.timer == nil) {
                            t.reset()
                        }
                }){
                    Text(timerResetButtonText)
                }.disabled(t.timer != nil).padding()
                Text(t.getCountDecimal()).font(monospaceFont)
                Spacer()
                Button(action: {dismiss()}, label: {Text("back")}).padding()
            }
        }
    }
}

