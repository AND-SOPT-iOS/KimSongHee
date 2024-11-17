//
//  PreviewImageModel.swift
//  SOPT
//
//  Created by 김송희 on 11/1/24.
//

import UIKit

struct PreviewImage: Hashable {
    let image: UIImage
}

extension PreviewImage {
    static let mockData: [PreviewImage] = [
        PreviewImage(image: UIImage(resource: .preview1)),
        PreviewImage(image: UIImage(resource: .preview2)),
        PreviewImage(image: UIImage(resource: .preview3)),
        PreviewImage(image: UIImage(resource: .preview4)),
        PreviewImage(image: UIImage(resource: .preview5)),
    ]
}
