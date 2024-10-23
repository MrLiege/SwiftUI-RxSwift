//
//  CoreData.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 23.10.2024.
//

import Foundation
import CoreData

final class CoreDataViewModel: ObservableObject {
    static let shared = CoreDataViewModel()
    
    let container: NSPersistentContainer
    @Published var savedEntities: [MeasurementEntity] = []
    
    private init() {
        container = NSPersistentContainer(name: "MyDoctor")
        container.loadPersistentStores { (description, error) in
            if let error = error {
                print("ERROR LOADING CORE DATA. \(error)")
            }
        }
        container.viewContext.automaticallyMergesChangesFromParent = true
        fetchData()
        addMockData()
    }
    
    func fetchData() {
        let request = NSFetchRequest<MeasurementEntity>(entityName: "MeasurementEntity")
        do {
            savedEntities = try container.viewContext.fetch(request)
        } catch let error {
            print("Error fetching. \(error)")
        }
    }
    
    func addMeasurement(systolic: Int16, diastolic: Int16, pulse: Int16, 
                        date: Date, time: Date, note: String) {
        let newMeasurement = MeasurementEntity(context: container.viewContext)
        newMeasurement.systolicPressure = systolic
        newMeasurement.diastolicPressure = diastolic
        newMeasurement.pulse = pulse
        newMeasurement.measurementDate = date
        newMeasurement.measurementTime = time
        newMeasurement.note = note
        saveData()
    }
    
    func updateMeasurement(entity: MeasurementEntity, systolic: Int16, 
                           diastolic: Int16, pulse: Int16, date: Date,
                           time: Date, note: String) {
        entity.systolicPressure = systolic
        entity.diastolicPressure = diastolic
        entity.pulse = pulse
        entity.measurementDate = date
        entity.measurementTime = time
        entity.note = note
        saveData()
    }
    
    func deleteMeasurement(indexSet: IndexSet) {
        guard let index = indexSet.first else { return }
        let entity = savedEntities[index]
        container.viewContext.delete(entity)
        saveData()
    }
    
    func saveData() {
        do {
            try container.viewContext.save()
            fetchData()
        } catch let error {
            print("Error saving. \(error)")
        }
    }
}

extension CoreDataViewModel {
    func addMockData() {
        for entity in savedEntities {
            container.viewContext.delete(entity)
        }
        saveData()

        addMeasurement(systolic: 120, diastolic: 80, pulse: 70, date: Date(), time: Date(), note: "Normal")
        addMeasurement(systolic: 140, diastolic: 90, pulse: 75, date: Date().addingTimeInterval(-86400), time: Date(), note: "High")
        addMeasurement(systolic: 110, diastolic: 70, pulse: 65, date: Date().addingTimeInterval(-2*86400), time: Date(), note: "Low")
    }
}
