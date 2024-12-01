//
//  CoreData.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 23.10.2024.
//

import Foundation
import CoreData

final class DataController: ObservableObject {
    static let shared = DataController()
    
    private var persistentContainer: NSPersistentContainer
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
    private init() {
        persistentContainer = NSPersistentContainer(name: "MyDoctor")
        
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Ошибка с Cora Data: \(error.localizedDescription)")
            }
        }
        
        viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
    }
    
    func saveNewMeasurement(diastolicPressure: Int16, systolicPressure: Int16, pulse: Int16, measurementDate: Date, measurementTime: Date, note: String) {
        let newMeasurement = MeasurementEntity(context: viewContext)
        newMeasurement.diastolicPressure = diastolicPressure
        newMeasurement.systolicPressure = systolicPressure
        newMeasurement.pulse = pulse
        newMeasurement.measurementDate = measurementDate
        newMeasurement.measurementTime = measurementTime
        newMeasurement.note = note
        
        do {
            try viewContext.save()
            print("Данные успешно сохранены в MeasurementEntity")
        } catch {
            print("Ошибка при сохранении MeasurementEntity: \(error.localizedDescription)")
        }
    }
    
    func fetchItems() -> [MeasurementEntity] {
        let fetchRequest: NSFetchRequest<MeasurementEntity> = MeasurementEntity.fetchRequest()
        
        do {
            return try viewContext.fetch(fetchRequest)
        } catch {
            print("Ошибка при получении данных: \(error.localizedDescription)")
            return []
        }
    }
}
