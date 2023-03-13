//
//  Trailer.swift
//  NetflixCloneSwiftUI
//
//  Created by Silva Kirsimae on 13/03/2023.
//

import Foundation

struct Trailer: Identifiable, Hashable {
    var id: String = UUID().uuidString
    var name: String
    var videoURL: URL
    var thumbnailImageURL: URL
}
