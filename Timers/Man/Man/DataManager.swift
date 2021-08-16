//
//  DataManager.swift
//  Man
//
//  Created by Max Polinkovsky on 11.08.21.
//

import Foundation

class DataManager: ObservableObject {
    
    var persons = [Person]()
    
    static func getPerson(_ idx: Int) -> Person {
        let names = ["David", "Lena", "John", "Tom", "Kasy", "Kat", "Jimmy"]
        let families = ["Jason", "Lass", "Connor", "Klug", "Peters", "Kray", "Groul"]
        let emails = ["anker@mail.com", "bering@mail.se", "creas@google.com", "trir@hook.fr", "death@br.de", "sloan@der.gr", "nadine@bds.com"]
        let tels = ["90234-87-65", "015221549822", "467-8921", "39-0123-87-98", "90-233-76-654", "521-87090", "56-987-766"]
        
        let name = names[Int.random(in: 0..<names.count)]
        let family = families[Int.random(in: 0..<families.count)]
        let email = emails[Int.random(in: 0..<emails.count)]
        let tel = tels[Int.random(in: 0..<tels.count)]
        
        return Person(name: name, family: family, tel: tel, email: email)
    }
        
    static func getPersons() -> [Person] {
        (0...6).map { DataManager.getPerson($0) }
    }
}
