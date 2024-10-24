//
//  Coordinator.swift
//  MyDoctor
//
//  Created by Artyom Petrichenko on 24.10.2024.
//

import Foundation

final class Coordinator: ObservableObject {
    @Published var isAddingDataViewPresented: Bool = false
    
    static let shared = Coordinator()
    
    private init() {}
}
