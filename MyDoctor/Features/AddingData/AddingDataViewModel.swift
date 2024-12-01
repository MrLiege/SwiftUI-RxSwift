//
//  AddingDataViewModel.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 24.10.2024.
//

import Foundation
import RxSwift
import RxCocoa
import CoreData

final class AddingDataViewModel: ObservableObject {
    @Published var listItems: [MeasurementEntity] = []
    
    private var dataController = DataController.shared
    
    init() {
        fetchItems()
    }
    
    func fetchItems() {
        listItems = dataController.fetchItems()
    }
    
    func addItem(diastolicPressure: Int16, systolicPressure: Int16, pulse: Int16, measurementDate: Date, measurementTime: Date, note: String) {
        dataController.saveNewMeasurement(diastolicPressure: diastolicPressure, systolicPressure: systolicPressure, pulse: pulse, measurementDate: measurementDate, measurementTime: measurementTime, note: note)
        fetchItems()
        printAllItems()
    }
    
    func printAllItems() {
        let items = dataController.fetchItems()
        for item in items {
            print("ID: \(item.id), Систолическое: \(item.systolicPressure), Диастолическое: \(item.diastolicPressure), Пульс: \(item.pulse), Дата: \(item.measurementDate), Время: \(item.measurementTime), Заметка: \(item.note ?? "")")
        }
    }
}
