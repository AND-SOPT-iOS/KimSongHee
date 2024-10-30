//
//  Photo.swift
//  SOPT
//
//  Created by 김송희 on 10/30/24.
//

import Foundation
import UIKit

struct Photo: Hashable {
    let id: UUID = UUID()
    let image: UIImage
    var isLiked: Bool
}


extension Photo {
    static let mockData: [Photo] = [
        Photo(image: UIImage(resource: .image1), isLiked: false),
        Photo(image: UIImage(resource: .image2), isLiked: false),
        Photo(image: UIImage(resource: .image3), isLiked: false),
        Photo(image: UIImage(resource: .image4), isLiked: false),
        Photo(image: UIImage(resource: .image5), isLiked: false),
        Photo(image: UIImage(resource: .image6), isLiked: false),
    ]
}
