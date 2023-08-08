//
//  RegisterRepository.swift
//  Ddungja
//
//  Created by 오승기 on 2023/08/05.
//

import Combine
import Moya
import UIKit

final class RegisterRepository: RegisterRepositoryInterface {
    private let datasource: RegisterDataSourceInterface
    
    init(datasource: RegisterDataSourceInterface) {
        self.datasource = datasource
    }
    
    func getRegisteredPet() -> AnyPublisher<[RegisteredPetVO], MoyaError> {
        return datasource.getRegisteredPet()
            .map { $0.toRegisteredPetVO() }
            .eraseToAnyPublisher()
    }
    
    func registerPost(_ vo: PetPostVO, _ images: [UIImage]) -> AnyPublisher<ApplyIDInfoVO, MoyaError> {
        return datasource.registerPost(vo, images)
            .map { $0.toApplyIdVO() }
            .eraseToAnyPublisher()
    }
}
