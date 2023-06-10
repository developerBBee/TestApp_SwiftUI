//
//  ContentView.swift
//  testApp
//
//  Created by ak on 2023/06/10.
//

import SwiftUI
import CoreData

struct ContentView: View {
    @Environment(\.managedObjectContext) private var viewContext

    @FetchRequest(
        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
        animation: .default)
    private var items: FetchedResults<Item>

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
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
