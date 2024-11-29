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
    let input: Input
    let output: Output
    
    private var disposeBag = DisposeBag()
    
    init() {
        self.input = Input()
        self.output = Output()
        
        bind()
    }
    
}

extension AddingDataViewModel {
    func bind() {
    }
}

extension AddingDataViewModel {
    struct Input {
    }
    
    struct Output {
    }
}
