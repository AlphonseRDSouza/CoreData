//
//  CoreDataStack.swift
//  ShoutOut
//
//  Created by alphonso on 7/8/19.
//  Copyright © 2019 Self Learner. All rights reserved.
//

import Foundation
import CoreData

// MARK: - Core Data stack

//xcdatamodelid->momd
//Bundle.main.url
func createMainContext() -> NSManagedObjectContext {
    //Initialize NSMangedObjectModel
    guard let mainUrl =  Bundle.main.url(forResource: "ShoutOut", withExtension: "momd") else { fatalError("main url issue")}
    guard let managedObjectModel = NSManagedObjectModel(contentsOf: mainUrl) else {
        fatalError("model not found")
    }
    
    let psc = NSPersistentStoreCoordinator(managedObjectModel: managedObjectModel)
    let storeUrl = URL.documentURL.appendingPathComponent("ShoutOut.sqlite")
    do {
        try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeUrl, options: nil)
    }catch  {
        print(error.localizedDescription)
    }
    
    let context = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
    context.persistentStoreCoordinator = psc
    return context
}

extension URL {
    static var documentURL: URL {
        return try! FileManager.default.url(for: .documentDirectory,
                                            in: .userDomainMask,
                                            appropriateFor: nil, create: true)
    }
}





//    lazy var persistentContainer: NSPersistentContainer = {
//        /*
//         The persistent container for the application. This implementation
//         creates and returns a container, having loaded the store for the
//         application to it. This property is optional since there are legitimate
//         error conditions that could cause the creation of the store to fail.
//        */
//        let container = NSPersistentContainer(name: "ShoutOut")
//        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
//            if let error = error as NSError? {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//
//                /*
//                 Typical reasons for an error here include:
//                 * The parent directory does not exist, cannot be created, or disallows writing.
//                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
//                 * The device is out of space.
//                 * The store could not be migrated to the current model version.
//                 Check the error message to determine what the actual problem was.
//                 */
//                fatalError("Unresolved error \(error), \(error.userInfo)")
//            }
//        })
//        return container
//    }()
//
//    // MARK: - Core Data Saving support
//
//    func saveContext () {
//        let context = persistentContainer.viewContext
//        if context.hasChanges {
//            do {
//                try context.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nserror = error as NSError
//                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
//            }
//        }
//    }
