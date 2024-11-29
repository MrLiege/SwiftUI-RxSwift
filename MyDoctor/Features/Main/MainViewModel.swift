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
    
    init() {
        self.input = Input()
        bind()
    }

    func bind() {
    }
}

extension MainViewModel {
    struct Input {
        
    }
}
