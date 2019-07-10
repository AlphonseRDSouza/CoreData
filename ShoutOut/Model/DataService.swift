//
//  DataService.swift
//  ShoutOut
//
//  Created by alphonso on 7/9/19.
//  Copyright © 2019 Self Learner. All rights reserved.
//

import Foundation
import CoreData

struct DataService: ManagedObjectContextDependentType {
    var managedObjectContext: NSManagedObjectContext!
    
    func seedEmployees() {
        
        guard let employer1 =  NSEntityDescription.insertNewObject(forEntityName: "Employee", into: self.managedObjectContext) as? Employee else { print("insertion failure")
            return
        }
        employer1.firstName = "Alphonse"
        employer1.lastName = "Dsouza"
        
        do {
            try self.managedObjectContext.save()
        }catch {
            print(error.localizedDescription)
            self.managedObjectContext.rollback()//rollback to initial preinsert state 
        }
    }
}
