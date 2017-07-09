//
//  FriendsEntity+CoreDataProperties.swift
//  RelationshipInCoreData
//
//  Created by MobioApp on 7/6/17.
//  Copyright © 2017 MobioApp. All rights reserved.
//

import Foundation
import CoreData


extension FriendsEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FriendsEntity> {
        return NSFetchRequest<FriendsEntity>(entityName: "FriendsEntity");
    }

    @NSManaged public var name: String?
    @NSManaged public var age: Int16
    @NSManaged public var isInvited: InvitationEntity?

}
