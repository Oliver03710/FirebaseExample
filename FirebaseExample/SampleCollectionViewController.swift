//
//  SampleCollectionViewController.swift
//  FirebaseExample
//
//  Created by Junhee Yoon on 2022/10/18.
//

import UIKit

import RealmSwift

final class SampleCollectionViewController: UICollectionViewController {
    
    // MARK: - Properties
    
    private var tasks: Results<Todo>!
    private let localRealm = try! Realm()
    
    var cellRegistration: UICollectionView.CellRegistration<UICollectionViewListCell, Todo>!
    
    
    // MARK: - Init
    
    override func viewDidLoad() {
        super.viewDidLoad()
        realmData()
        configureCollectionView()
    }
    
    
    // MARK: - Helper Functions
    
    private func realmData() {
        tasks = localRealm.objects(Todo.self)
    }
    
    private func configureCollectionView() {
        
        let configuration = UICollectionLayoutListConfiguration(appearance: .insetGrouped)
        
        // UICollectionViewCompositionalLayout
        let layout = UICollectionViewCompositionalLayout.list(using: configuration)
        
        // UICollectionViewLayout
        collectionView.collectionViewLayout = layout
        
        cellRegistration = UICollectionView.CellRegistration(handler: { cell, indexPath, itemIdentifier in
            
            var content = cell.defaultContentConfiguration()
            content.image = itemIdentifier.importance < 2 ? UIImage(systemName: "person.fill") : UIImage(systemName: "person.2.fill")
            content.text = itemIdentifier.title
            content.secondaryText = "\(itemIdentifier.detail.count)개의 세부 항목"
            
            cell.contentConfiguration = content
        })
    }
    
    
    // MARK: - CollectionView Functions
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tasks.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let item = tasks[indexPath.item]
        let cell = collectionView.dequeueConfiguredReusableCell(using: cellRegistration, for: indexPath, item: item)
        
//        var test: Fruits = Apple()
//        test = Banana()
//        test = Melon()
        
        return cell
    }
}




// MARK: - Text

//class Food {
//    
//}
//
//protocol Fruits {
//    
//}
//
//class Apple: Food, Fruits {
//    
//}
//
//class Banana: Food, Fruits {
//    
//}
//
//enum Strawberries: Fruits {
//    
//}
//
//struct Melon: Fruits {
//    
//}
