//
//  Employee.swift
//  ShoutOut
//
//  Created by alphonso on 7/9/19.
//  Copyright © 2019 Self Learner. All rights reserved.
//

import Foundation
import CoreData

class Employee: NSManagedObject {
    @NSManaged var firstName: String
    @NSManaged var lastName: String
    @NSManaged var shoutOuts: NSSet?//(to-many)
}
