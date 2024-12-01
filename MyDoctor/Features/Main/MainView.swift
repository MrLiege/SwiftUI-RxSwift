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
    @State private var viewModel: MainViewModel = MainViewModel()
    @State private var navPath = NavigationPath()
    @State private var selectedSegment: Period = .day
    @StateObject private var coreDataViewModel = DataController.shared
    
    var body: some View {
        NavigationStack(path: $navPath) {
            VStack(spacing: 16) {
                DataButtonView(navPath: $navPath, date: Date())
                SegmentedControlView(selectedSegment: $selectedSegment)
                ChartView(systolicData: viewModel.systolicData, diastolicData: viewModel.diastolicData, timePoints: viewModel.timePoints)
                NoteView()
                Spacer()
            }
            .frame(maxWidth: .infinity)
            .background(MainBackgroundView())
            .customNavigationTitle(title: "Мой доктор", imageName: "logo")
        }
    }
}
