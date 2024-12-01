//
//  MainViewModel.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 22.10.2024.
//

import Foundation
import RxSwift
import RxCocoa
import CoreData

final class MainViewModel: ObservableObject {
    @Published var systolicData: [Double] = []
    @Published var diastolicData: [Double] = []
    @Published var timePoints: [String] = []

    private var dataController = DataController.shared

    init() {
        fetchData()
    }

    func fetchData() {
        let measurements = dataController.fetchItems()
        systolicData = measurements.map { Double($0.systolicPressure) }
        diastolicData = measurements.map { Double($0.diastolicPressure) }
        timePoints = measurements.map { DateFormatter.timeFormatter.string(from: $0.measurementTime ?? Date()) }
    }
}

private extension DateFormatter {
    static let timeFormatter: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateFormat = "HH:mm"
        return formatter
    }()
}
