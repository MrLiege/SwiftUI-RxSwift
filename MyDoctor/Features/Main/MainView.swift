//
//  ContentView.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 21.10.2024.
//

import SwiftUI
import CoreData
import RxSwift

struct MainView: View {
    @State private var selectedSegment: Period = .day
    @StateObject private var viewModel = MainViewModel()
    @StateObject private var coreDataViewModel = CoreDataViewModel.shared

    var body: some View {
        NavigationStack {
            VStack(spacing: 16) {
                DataButtonView(viewModel: viewModel, date: Date())
                SegmentedControlView(selectedSegment: $selectedSegment)

                let data = getData(for: selectedSegment)

                ChartView(systolicData: data.systolicData, diastolicData: data.diastolicData, timePoints: data.timePoints)

                NoteView()

                Spacer()

                NavigationLink(destination: AddingDataView().navigationBarBackButtonHidden(true),
                               isActive: $viewModel.isAddingDataViewPresented) {
                    EmptyView()
                }.hidden()
            }
            .customNavigationTitle(title: "Мой доктор", imageName: "logo")
        }
    }
}

extension MainView {
    func getData(for period: Period) -> (systolicData: [Double], diastolicData: [Double], timePoints: [String]) {
        let formatter = DateFormatter()
        formatter.dateStyle = .short
        formatter.timeStyle = .short

        switch period {
        case .day:
            let intervals: [Int] = [0, 6, 12, 18, 24]
            let dateFormatter = DateComponentsFormatter()
            dateFormatter.unitsStyle = .abbreviated
            dateFormatter.allowedUnits = [.hour]
            let timePoints = intervals.map { dateFormatter.string(from: TimeInterval($0 * 3600)) ?? "" }
            return (
                Array(coreDataViewModel.savedEntities.prefix(timePoints.count).compactMap { Double($0.systolicPressure) }),
                Array(coreDataViewModel.savedEntities.prefix(timePoints.count).compactMap { Double($0.diastolicPressure) }),
                timePoints
            )
        case .week:
            let days: [TimeInterval] = Array(0..<7).map { TimeInterval($0 * 86400) }
            let timePoints = days.map { formatter.string(from: Date().addingTimeInterval($0)) }
            return (
                Array(coreDataViewModel.savedEntities.prefix(timePoints.count).compactMap { Double($0.systolicPressure) }),
                Array(coreDataViewModel.savedEntities.prefix(timePoints.count).compactMap { Double($0.diastolicPressure) }),
                timePoints
            )
        case .month:
            let weeks: [TimeInterval] = Array(0..<7).map { TimeInterval($0 * 7 * 86400) }
            let timePoints = weeks.map { formatter.string(from: Date().addingTimeInterval($0)) }
            return (
                Array(coreDataViewModel.savedEntities.prefix(timePoints.count).compactMap { Double($0.systolicPressure) }),
                Array(coreDataViewModel.savedEntities.prefix(timePoints.count).compactMap { Double($0.diastolicPressure) }),
                timePoints
            )
        }
    }
}
