//
//  CountData.swift
//  testApp
//
//  Created by ak on 2023/06/11.
//

import Foundation

class CountData: ObservableObject{
    @Published var count: Int = 0

    func plusOneCount() {
        count = count + 1
    }

    func resetCount() {
        count = 0
    }

    func getCount() -> String {
        return String(count)
    }
}
