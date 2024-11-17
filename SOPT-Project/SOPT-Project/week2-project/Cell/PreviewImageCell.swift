//
//  PreviewImageCell.swift
//  SOPT
//
//  Created by 김송희 on 11/1/24.
//

import UIKit

class PreviewImageCell: UICollectionViewCell {
 
    static let identifier = "PreviewImageCell"
    
    private let previewImageView = UIImageView().then {
        $0.contentMode = .scaleAspectFit
        $0.clipsToBounds = true
        $0.layer.cornerRadius = 25
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setUI()
        setLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUI() {
        addSubviews(previewImageView)
    }
    
    private func setLayout() {
        previewImageView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
    
    func bind(_ mockData: PreviewImage) {
        previewImageView.image = mockData.image
    }
}
