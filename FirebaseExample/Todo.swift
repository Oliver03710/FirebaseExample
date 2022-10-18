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
    @Persisted var importance: Int
    
    @Persisted(primaryKey: true) var objectId: ObjectId
    
    @Persisted var detail: List<DetailTodo>
    
    @Persisted var memo: Memo?
    
    convenience init(title: String, importance: Int) {
        self.init()
        self.title = title
        self.importance = importance
    }
}

final class DetailTodo: Object {
    @Persisted var detailTitle: String
    @Persisted var favourite: Bool
    @Persisted var deadline: Date
    
    @Persisted(primaryKey: true) var objectId: ObjectId
    
    convenience init(detailTitle: String, favourite: Bool) {
        self.init()
        self.detailTitle = detailTitle
        self.favourite = favourite
    }
}

final class Memo: EmbeddedObject {
    @Persisted var content: String
    @Persisted var date: Date
    
    convenience init(content: String, date: Date) {
        self.init()
        self.content = content
        self.date = date
    }
}
