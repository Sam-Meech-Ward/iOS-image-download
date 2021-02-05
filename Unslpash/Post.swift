//
//  Post.swift
//  Unslpash
//
//  Created by Sam Meech-Ward on 2020-05-25.
//  Copyright © 2020 Sam Meech-Ward. All rights reserved.
//

import Foundation

struct PostUserProfileImage: Codable {
  let medium: String
}

struct PostUser: Codable {
  let profile_image: PostUserProfileImage
}

struct PostUrls: Codable {
  let regular: String
}

struct Post: Codable {
  let id: String
  let description: String?
  let user: PostUser
  let urls: PostUrls
}
