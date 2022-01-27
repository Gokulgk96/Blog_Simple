//
//  Data_Model.swift
//  Blog_Simple
//
//  Created by Gokul Gopalakrishnan on 26/01/22.
//

import Foundation

struct articles: Codable
{
    var articles: [Blogs]
}

struct Blogs: Codable
{
    var id: Int
    var title: String
    var created_at: String
    var body_html: String
    var blog_id: Int
    var author: String
    var user_id: Int
    var published_at: String
    var updated_at: String
    var summary_html: String
    var handle: String
    var tags: String
    var admin_graphql_api_id: String
    var image: image_world
}

struct image_world: Codable
{
    var created_at: String
    var alt: String
    var width: Int
    var height: Int
    var src: String
}
