//
//  ShoutOutEditorVC.swift
//  ShoutOut
//
//  Created by alphonso on 7/8/19.
//  Copyright © 2019 Self Learner. All rights reserved.
//

import UIKit
import CoreData

class ShoutOutEditorVC: UIViewController, ManagedObjectContextDependentType {
    var managedObjectContext: NSManagedObjectContext!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
    }

    @IBAction func cancelBtnTapped(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
}
extension ShoutOutEditorVC {
    
}

