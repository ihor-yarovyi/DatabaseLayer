//
//  InMemoryCoreDataStack.swift
//  Database
//
//  Created by Ihor Yarovyi on 7/18/21.
//

import CoreData

extension Database {
    final class InMemoryCoreDataStack: BaseCoreDataStack {
        override func setup(with completion: ((Error?) -> Void)?) {
            let url = NSPersistentContainer.defaultDirectoryURL().appendingPathComponent(modelName)
            let description = NSPersistentStoreDescription(url: url)
            description.type = NSInMemoryStoreType
            container.persistentStoreDescriptions = [description]
            container.loadPersistentStores { _, error in
                completion?(error)
            }
        }
    }
}
