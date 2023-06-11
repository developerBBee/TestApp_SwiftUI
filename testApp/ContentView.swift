//
//  ContentView.swift
//  testApp
//
//  Created by ak on 2023/06/10.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

    var count = 0
    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                NavigationLink(destination: CountUP()) {
                    Text("画面遷移 CountUP")
                }
                Spacer()
                NavigationLink(destination: MyImage()) {
                    Text("画面遷移 MyImage")
                }
                Spacer()
            }.navigationBarTitle("Home")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
