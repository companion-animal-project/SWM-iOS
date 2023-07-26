//
//  KakakoAuthViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/19.
//

import Foundation
import Combine

class KakakoAuthViewModel: ObservableObject {
    private var coordinator: CoordinatorProtocol
    private let loginUsecase: LoginUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    
    init(coordinator: CoordinatorProtocol, loginUsecase: LoginUsecaseInterface) {
        self.coordinator = coordinator
        self.loginUsecase = loginUsecase
    }
}
