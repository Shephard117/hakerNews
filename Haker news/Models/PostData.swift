//
//  PostData.swift
//  Haker news
//
//  Created by Дмитрий Скоробогаты on 23.08.2021.
//

import Foundation

struct PostData: Decodable {
    let hits: [Post]
}

struct Post: Decodable, Identifiable {
    var id: String {
        return objectID
    }
    let objectID: String
    let points: Int
    let title: String
    let url: String?
}
