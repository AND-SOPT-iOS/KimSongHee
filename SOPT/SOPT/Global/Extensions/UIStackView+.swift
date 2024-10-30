//
//  UIStackView+.swift
//  SOPT
//
//  Created by 김송희 on 10/30/24.
//

import UIKit

extension UIStackView {
    
    func addArrangedSubviews(_ views: UIView...) {
        views.forEach {
            self.addArrangedSubview($0)
        }
    }
}
