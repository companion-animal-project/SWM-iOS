//
//  CertificationRequestVO.swift
//  Ddungja
//
//  Created by 오승기 on 2023/07/29.
//

import Foundation

struct CertificationRequestVO: Encodable {
    let certificationId: Int
    let phoneNumber: String
    let certificationNumber: String
}
