//
//  RegisterViewModel.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/05.
//

import Foundation
import Combine

enum Gender: String {
    case male = "MALE"
    case female = "FEMALE"
}

enum Neutered: String{
    case yes = "YES"
    case no = "NO"
}


final class RegisterViewModel: ObservableObject {
    private var coordinator: CoordinatorProtocol
    private let registerUsecase: RegisterUsecaseInterface
    private var cancellables = Set<AnyCancellable>()
    
    @Published var registeredPetInfo = [RegisteredPetVO]()
    @Published var images = Array(repeating: Data(), count: 5)
    
    @Published var petType = ""
    @Published var petName = ""
    @Published var region = ""
    @Published var gender = Gender.male.rawValue
    @Published var neutered = Neutered.yes.rawValue
    @Published var year = ""
    @Published var month = ""
    @Published var reason = ""
    @Published var advantage = ""
    @Published var disAdvantage = ""
    @Published var cost = ""
    @Published var adopter = ""
    
    
    init(coordinator: CoordinatorProtocol, registerUsecase: RegisterUsecaseInterface) {
        self.coordinator = coordinator
        self.registerUsecase = registerUsecase
    }
    
    func getRegisteredPet() {
        registerUsecase.getRegisteredPet()
            .sink { error in
                print(error)
            } receiveValue: { [weak self] vo in
                self?.registeredPetInfo = vo
            }
            .store(in: &cancellables)
    }
    
    func push(_ page: Page) {
        coordinator.push(page)
    }
}
