//
//  MyTimer.swift
//  testApp
//
//  Created by ak on 2023/06/11.
//

import Foundation

class MyTimer: ObservableObject{
    // @Published で ObservableObjectのプロパティ変更をUI側に提供し、描画してもらう
    // 型! -> ImplicitlyUnwrappedOptional 参照時にOptionalからTimerへ自動アンラップ、実質nil許容型
    @Published var timer: Timer!
    @Published var count: Int = 0

    func start() {
        // Optional Chaining： 参照先(timer)に ? をつけるとtimerがnilならinvalidate()を実行しないでnilを返す
        self.timer?.invalidate() // すでにある場合は停止
        self.timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: true
        ) {
            _ in
            self.count += 1
        }
    }

    func stop() {
        self.timer?.invalidate() // 停止
        self.timer = nil
    }

    func reset() {
        self.count = 0
    }

    func getCountDecimal() -> String {
        return "\(String(format: "%.2f", Double(self.count) * 0.01))"
    }

    func destroy() {
        self.count = 0
        self.stop()
    }
}
