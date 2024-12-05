//
//  UIImage+.swift
//  SOPT-Project
//
//  Created by 김송희 on 12/6/24.
//

import UIKit

extension UIImage {
    static func coloredImage(
        color: UIColor,
        size: CGSize = CGSize(width: 350, height: 250)
    ) -> UIImage {
            let rect = CGRect(origin: .zero, size: size)
            UIGraphicsBeginImageContextWithOptions(size, false, 0)
            color.setFill()
            UIRectFill(rect)
            let image = UIGraphicsGetImageFromCurrentImageContext()
            UIGraphicsEndImageContext()
            return image ?? UIImage()
        }
}
