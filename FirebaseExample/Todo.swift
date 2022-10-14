//
//  Todo.swift
//  FirebaseExample
//
//  Created by Junhee Yoon on 2022/10/13.
//

import Foundation
import RealmSwift

final class Todo: Object {
    @Persisted var title: String
    @Persisted var favourite: Double
    @Persisted var userDescription: String
    @Persisted var count: Int
    
    @Persisted(primaryKey: true) var objectId: ObjectId
    
    convenience init(title: String, importance: Int) {
        self.init()
        self.title = title
        self.favourite = Double(importance)
    }
}

