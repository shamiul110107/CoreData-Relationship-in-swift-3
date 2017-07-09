//
//  InvitationEntity+CoreDataProperties.swift
//  RelationshipInCoreData
//
//  Created by MobioApp on 7/6/17.
//  Copyright © 2017 MobioApp. All rights reserved.
//

import Foundation
import CoreData


extension InvitationEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<InvitationEntity> {
        return NSFetchRequest<InvitationEntity>(entityName: "InvitationEntity");
    }

    @NSManaged public var invited: Bool
    @NSManaged public var invitedFriends: FriendsEntity?

}
