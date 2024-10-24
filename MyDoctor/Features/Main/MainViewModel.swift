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
    let input: Input
    let coordinator: Coordinator = .shared
    
    private var disposeBag = DisposeBag()
    
    init() {
        self.input = Input()
        bind()
    }

    func bind() {
        input.settingButtonTap
            .subscribe(onNext: {
                self.coordinator.isAddingDataViewPresented = true
            })
            .disposed(by: disposeBag)
    }
}

extension MainViewModel {
    struct Input {
        let settingButtonTap = PublishSubject<Void>()
    }
}
