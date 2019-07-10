//
//  ShoutOutTests.swift
//  ShoutOutTests
//
//  Created by alphonso on 7/8/19.
//  Copyright © 2019 Self Learner. All rights reserved.
//

import XCTest
//import UIKit
import  CoreData

@testable import ShoutOut

class ShoutOutTests: XCTestCase {

    var vcUnderTest: ShoutOutDraftsVC!
    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        let storyboard = UIStoryboard(name: "Main", bundle: Bundle.main)
        guard let navC = storyboard.instantiateInitialViewController() as? UINavigationController else { return }
        guard let firstVC = navC.viewControllers.first as? ShoutOutDraftsVC else { return }
        vcUnderTest = firstVC
        
        UIApplication.shared.keyWindow?.rootViewController = vcUnderTest
        
        //IBOutlet & IBAction to loaded for test
        // Using the preloadView() extension method
        navC.preloadView()
        vcUnderTest.preloadView()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

//    func testExample() {
//        // This is an example of a functional test case.
//        // Use XCTAssert and related functions to verify your tests produce the correct results.
//    }
//
//    func testPerformanceExample() {
//        // This is an example of a performance test case.
//        self.measure {
//            // Put the code you want to measure the time of here.
//        }
//    }
    
    func testManagedObjectContext() {
        
        let managedContextObject = createMainContextInMemory()
        self.vcUnderTest.managedObjectContext = managedContextObject//Dependency injection
        XCTAssertNotNil(self.vcUnderTest.managedObjectContext)
        
    }

    
}

func createMainContextInMemory() -> NSManagedObjectContext {
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

extension UIViewController {
    func preloadView() {
        _ = view
    }
}
