//
//  InvitedViewController.swift
//  RelationshipInCoreData
//
//  Created by MobioApp on 7/6/17.
//  Copyright © 2017 MobioApp. All rights reserved.
//

import UIKit
import CoreData
class InvitedViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    var intivedFriendsList : [FriendsEntity] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
       title = "Friends"
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return intivedFriendsList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let f : FriendsEntity = self.intivedFriendsList[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell1", for: indexPath) as! TableViewCell
        cell.invitedLabel.text = f.name
        return cell
    }
    
}
