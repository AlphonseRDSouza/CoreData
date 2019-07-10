//
//  ShoutOut.swift
//  ShoutOut
//
//  Created by alphonso on 7/8/19.
//  Copyright © 2019 Self Learner. All rights reserved.
//

import Foundation
import  CoreData

class ShoutOut : NSManagedObjectModel {
    @NSManaged var from: String?
    @NSManaged var message: String?
    @NSManaged var sentDate: Date?
    @NSManaged var shoutCategory: String
    @NSManaged var toEmployee: Employee//(to-One)
}
