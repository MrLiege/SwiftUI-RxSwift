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
    let coordinator: Coordinator = .shared
    
    private var disposeBag = DisposeBag()
    
    init() {
        self.input = Input()
        self.output = Output()
        
        bind()
    }
    
}

extension AddingDataViewModel {
    func bind() {
        input.backButtonTap
            .subscribe(onNext: {
                self.coordinator.isAddingDataViewPresented = false
            })
            .disposed(by: disposeBag)
    }
}

extension AddingDataViewModel {
    struct Input {
        let backButtonTap = PublishSubject<Void>()
    }
    
    struct Output {
        let backButtonTapped = PublishSubject<Void>()
    }
}
