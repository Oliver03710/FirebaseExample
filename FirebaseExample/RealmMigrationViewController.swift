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
    }
    
}
