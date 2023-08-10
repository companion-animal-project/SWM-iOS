//
//  UserProfileAPIProvider.swift
//  Ddungja
//
//  Created by 오승기 on 2023/06/28.
//

import Foundation
import Moya
import CombineMoya
import Combine

protocol UserProfileDataSourceInterface {
    func getUserProfile() -> AnyPublisher<ProfileDetailDTO, Error>
    func putEditUserProfile(profile: ProfileEditVO) -> AnyPublisher<ProfileRegisterDTO, Error>
}
    
final class UserProfileAPIProvider: UserProfileDataSourceInterface {
    let moyaProvider: MoyaProvider<UserProfileAPI>
    
    init(moyaProvider: MoyaProvider<UserProfileAPI> = .init()) {
        self.moyaProvider = moyaProvider
    }
    
    func getUserProfile() -> AnyPublisher<ProfileDetailDTO, Error> {
        return moyaProvider.requestPublisher(.detail(userId: "1"))
            .asResult()
    }
    
    func putEditUserProfile(profile: ProfileEditVO) -> AnyPublisher<ProfileRegisterDTO, Error> {
        let profileDTO = profile.toData(profile: profile)
        
        return moyaProvider.requestPublisher(.modify(userInfo: profileDTO))
            .asResult()
    }
}
