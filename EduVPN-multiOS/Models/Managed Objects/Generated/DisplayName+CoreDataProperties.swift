//
//  DisplayName+CoreDataProperties.swift
//  eduVPN
//
//

import Foundation
import CoreData

extension DisplayName {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<DisplayName> {
        return NSFetchRequest<DisplayName>(entityName: "DisplayName")
    }

    @NSManaged public var displayName: String?
    @NSManaged public var locale: String?
    @NSManaged public var instance: Instance?
    @NSManaged public var profile: Profile?

}
