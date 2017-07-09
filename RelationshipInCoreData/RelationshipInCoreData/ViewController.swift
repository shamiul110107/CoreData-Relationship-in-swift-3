//
//  ViewController.swift
//  RelationshipInCoreData
//
//  Created by MobioApp on 7/6/17.
//  Copyright © 2017 MobioApp. All rights reserved.
//

import UIKit
import CoreData
class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var myTableView: UITableView!
    var friends: [FriendsEntity] = []
    var invitedFriends: [FriendsEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "UnInviteFriends"
        // Do any additional setup after loading the view, typically from a nib.
        //createDemoData()
        fetchAllFriends()
    }

    func createDemoData() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        
        let friendEntity = NSEntityDescription.entity(forEntityName: "FriendsEntity", in: manageContext)
        
        let invitationEntity = NSEntityDescription.entity(forEntityName: "InvitationEntity", in: manageContext)
        
        if friendEntity != nil {
            
            let friend1 = FriendsEntity(entity: friendEntity!, insertInto: manageContext)
            friend1.name = "Rambo"
            friend1.age = 16
            friend1.isInvited = InvitationEntity(entity: invitationEntity!, insertInto: manageContext)

            let friend2 = FriendsEntity(entity: friendEntity!, insertInto: manageContext)
            friend2.name = "Terminator"
            friend2.age = 16
            friend2.isInvited = InvitationEntity(entity: invitationEntity!, insertInto: manageContext)

            let friend3 = FriendsEntity(entity: friendEntity!, insertInto: manageContext)
            friend3.name = "John McClane"
            friend3.age = 16
            friend3.isInvited = InvitationEntity(entity: invitationEntity!, insertInto: manageContext)

            let friend4 = FriendsEntity(entity: friendEntity!, insertInto: manageContext)
            friend4.name = "Joker"
            friend4.age = 16
            friend4.isInvited = InvitationEntity(entity: invitationEntity!, insertInto: manageContext)

            let friend5 = FriendsEntity(entity: friendEntity!, insertInto: manageContext)
            friend5.name = "Chuck Norris"
            friend5.age = 16
            friend5.isInvited = InvitationEntity(entity: invitationEntity!, insertInto: manageContext)

            
            let friend6 = FriendsEntity(entity: friendEntity!, insertInto: manageContext)
            friend6.name = "sami"
            friend6.age = 25
            friend6.isInvited = InvitationEntity(entity: invitationEntity!, insertInto: manageContext)

            do {
                try manageContext.save()
                print("SAVED DEMO DATA")
            } catch {
                
                print("Error = \(error)")
            }
        }
    }
    
    func fetchAllFriends() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext

        let fetchRequest: NSFetchRequest = NSFetchRequest<FriendsEntity>(entityName: "FriendsEntity")
        fetchRequest.returnsObjectsAsFaults = false
        
        do {
            let results = try manageContext.fetch(fetchRequest)
            friends = results
        }
        catch {
            fatalError("There was an error fetching the items")
        }
    }
    
    func fetchInvitedFriends() {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        
        let fetchRequest: NSFetchRequest = NSFetchRequest<FriendsEntity>(entityName: "FriendsEntity")
        fetchRequest.predicate = NSPredicate(format: "isInvited.invited == true")
      
        do {
            let results = try manageContext.fetch(fetchRequest)
            self.invitedFriends = results
            
        }
        catch {
            fatalError("There was an error fetching the items")
        }
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return friends.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
         let f = self.friends[indexPath.row]
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.textLabel?.text = f.name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        let manageContext = appDelegate.persistentContainer.viewContext
        
        let f : FriendsEntity = self.friends[indexPath.row]
        f.isInvited?.invited = true
        
        do {
            try manageContext.save()
        } catch {
            
        }
        self.friends.remove(at: indexPath.row)
        self.invitedFriends.append(f)
        self.myTableView.deleteRows(at: [indexPath], with: .automatic)

    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
          if segue.identifier == "invitedFriends" {
            let identifire = segue.destination as? InvitedViewController
            identifire?.intivedFriendsList = invitedFriends

            
        }
    }
}

