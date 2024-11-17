//
//  UIView+.swift
//  SOPT
//
//  Created by 김송희 on 10/17/24.
//

import UIKit

extension UIView {
    
    // UIView 여러 개 인자로 받아서 한 번에 addSubview하는 메소드
    func addSubviews(_ views: UIView...) {
        views.forEach {
            self.addSubview($0)
            $0.translatesAutoresizingMaskIntoConstraints = false
        }
    }
    
}
