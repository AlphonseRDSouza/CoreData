//
//  ShoutOutDraftsVC.swift
//  ShoutOut
//
//  Created by alphonso on 7/9/19.
//  Copyright © 2019 Self Learner. All rights reserved.
//

import UIKit
import CoreData

enum SegueType: String {
    case shoutOutDetails
    case addShoutOut
    case unknown
}

class ShoutOutDraftsVC: UIViewController, ManagedObjectContextDependentType {
    var managedObjectContext: NSManagedObjectContext!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
     // Get the new view controller using segue.destination.
     // Pass the selected object to the new view controller.
     }
     */
    
}

extension ShoutOutDraftsVC: UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "subtitleCell", for: indexPath)
        
        cell.textLabel?.text = "Alphonse"
        cell.detailTextLabel?.text = "Great Job!"
        
        return cell
        
    }
}
extension ShoutOutDraftsVC: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        
    }
}


extension ShoutOutDraftsVC {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?){
        guard let identifier = segue.identifier else { return  }
        switch SegueType(rawValue: identifier) ?? .unknown {
        case .shoutOutDetails:
            
            guard let destVC = segue.destination as? ShoutOutDetailsVC else {return}
            destVC.managedObjectContext = self.managedObjectContext
            
            break
        case .addShoutOut:
            guard let navVC = segue.destination as? UINavigationController, let destVC = navVC.viewControllers.first as? ShoutOutEditorVC else {return}
            destVC.managedObjectContext = self.managedObjectContext
            
            break
        default:
            break
        }
    }
}
