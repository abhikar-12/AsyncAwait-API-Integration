//
//  UserModel.swift
//  Await
//
//  Created by Abhishek Kusalkar on 18/02/26.
//

import Foundation

struct UserModel : Identifiable, Codable, Hashable {
    let id: Int?
    let login: String?
    let avatar_url: String?
    let url: String?
}

