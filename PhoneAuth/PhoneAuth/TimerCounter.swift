//
//  TimerCounter.swift
//  PhoneAuth
//
//  Created by Max Polinkovsky on 14.08.21.
//

import SwiftUI
import Combine

final class TimerCounter: ObservableObject { //протокол позволяющий наблюдать за объектом, Combine
    
    let objectWillChange = PassthroughSubject<TimerCounter, Never>() // передача объекта подписчикам, TimerCounter  - наблюдаемый объект, Never - всегда передаются изменения объекта его подписчикам с момента создания
    var counter = 60
    var timer: Timer?

    func startTimer() {
        if counter > 0 {
            timer = Timer.scheduledTimer(
                timeInterval: 1,
                target: self, //действие обработки
                selector: #selector(updateCounter),
                userInfo: nil,
                repeats: true)
        }
        objectWillChange.send(self) //посылает сам себя подписчику
    }
    
    @objc private func updateCounter() {
        if counter > 0 {
            counter -= 1
        } else {
            killTimer()
        }
        objectWillChange.send(self)
    }
    
    private func killTimer() {
        timer?.invalidate()
        timer = nil
    }
}
