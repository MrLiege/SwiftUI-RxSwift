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
    private var disposeBag = DisposeBag()
    
    // MARK: Output for Binding<Bool>
    @Published var isAddingDataViewPresented: Bool = false

    init() {
        self.input = Input()
        bind()
    }

    func bind() {
        input.settingButtonTap
            .subscribe(onNext: { [weak self] in
                self?.isAddingDataViewPresented = true
            })
            .disposed(by: disposeBag)
    }
}

extension MainViewModel {
    struct Input {
        let settingButtonTap = PublishSubject<Void>()
    }
}
