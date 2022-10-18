//
//  RealmMigrationViewController.swift
//  FirebaseExample
//
//  Created by Junhee Yoon on 2022/10/13.
//

import UIKit
import RealmSwift

final class RealmMigrationViewController: UIViewController {

    // MARK: - Properties
    
    let localRealm = try! Realm()
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    
    // MARK: - Helper Functions
    
    func configureUI() {
        
        // 1. fileURL
        print("FileURL: \(localRealm.configuration.fileURL)")
        
        // 2. schemaVersion
        do {
            let version = try schemaVersionAtURL(localRealm.configuration.fileURL!)
            print("Schema Version: \(version)")
        } catch {
            print(error)
        }
        
        // 3. Test
//        for i in 1...100 {
//            let task = Todo(title: "고래밥의 할일 \(i)", importance: Int.random(in: 1...5))
//
//            try! localRealm.write {
//                localRealm.add(task)
//            }
//        }
        
//        for i in 1...100 {
//            let task = DetailTodo(detailTitle: "양파 \(i)개 사기", favourite: true)
//
//            try! localRealm.write {
//                localRealm.add(task)
//            }
//        }
        
        // 특정 Todo 테이블에 DetailTodo 추가
//        guard let task = localRealm.objects(Todo.self).filter("title = '고래밥의 할일 7'").first else { return }
//
//        let detail = DetailTodo(detailTitle: "프랭크 5개 먹기", favourite: true)
//
//        try! localRealm.write {
//            task.detail.append(detail)
//        }
        
        // 특정 Todo 테이블에 DetailTodo 추가
//        guard let task = localRealm.objects(Todo.self).filter("title = '고래밥의 할일 3'").first else { return }
//
//        let detail = DetailTodo(detailTitle: "깡깡한 아이스크림 \(Int.random(in: 1...5))개 먹기", favourite: false)
//
//        try! localRealm.write {
//            task.detail.append(detail)
//        }
        
        // 특정 Todo 테이블 삭제
//        guard let task = localRealm.objects(Todo.self).filter("title = '고래밥의 할일 7'").first else { return }
//        
//        try! localRealm.write {
//            localRealm.delete(task.detail)
//            localRealm.delete(task)
//        }
        
        // 특정 Todo에 메모 추가
        guard let task = localRealm.objects(Todo.self).filter("title = '고래밥의 할일 6'").first else { return }
        
        let memo = Memo()
        memo.content = "이렇게 메모 내용을 추가해봅니다."
        memo.date = Date()
        
        try! localRealm.write {
            task.memo = memo
        }
    }
    
}
