//
//  CertificateModel.swift
//  EduVPN
//
//  Created by Jeroen Leenarts on 08-01-18.
//  Copyright © 2018 SURFNet. All rights reserved.
//

import Foundation
import ASN1Decoder

struct CertificateModel: Decodable {
    var certificateString: String
    var privateKeyString: String
    var x509Object: X509Certificate? {
        return try? X509Certificate(data: certificateString.data(using: .utf8)!)
    }
}

extension CertificateModel {
    enum CertificateModelKeys: String, CodingKey {
        case createKeypair = "create_keypair"
        case data
        case certificate
        case privateKey = "private_key"
        case okKey = "ok"
    }

    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CertificateModelKeys.self)
        let createKeypairResponse = try container.nestedContainer(keyedBy: CertificateModelKeys.self, forKey: .createKeypair)
        let okResult = try createKeypairResponse.decode(Bool.self, forKey: .okKey)
        let data = try createKeypairResponse.nestedContainer(keyedBy: CertificateModelKeys.self, forKey: .data)
        certificateString = try data.decode(String.self, forKey: .certificate)
        privateKeyString = try data.decode(String.self, forKey: .privateKey)
    }
}