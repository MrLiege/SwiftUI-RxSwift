//
//  MeasurementEntity+CoreDataProperties.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 23.10.2024.
//
//

import Foundation
import CoreData


extension MeasurementEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<MeasurementEntity> {
        return NSFetchRequest<MeasurementEntity>(entityName: "MeasurementEntity")
    }

    @NSManaged public var diastolicPressure: Int16
    @NSManaged public var measurementDate: Date?
    @NSManaged public var measurementTime: Date?
    @NSManaged public var note: String?
    @NSManaged public var pulse: Int16
    @NSManaged public var systolicPressure: Int16
    @NSManaged public var measurement: NSSet?

}

// MARK: Generated accessors for measurement
extension MeasurementEntity {

    @objc(addMeasurementObject:)
    @NSManaged public func addToMeasurement(_ value: MeasurementEntity)

    @objc(removeMeasurementObject:)
    @NSManaged public func removeFromMeasurement(_ value: MeasurementEntity)

    @objc(addMeasurement:)
    @NSManaged public func addToMeasurement(_ values: NSSet)

    @objc(removeMeasurement:)
    @NSManaged public func removeFromMeasurement(_ values: NSSet)

}

extension MeasurementEntity : Identifiable {

}
