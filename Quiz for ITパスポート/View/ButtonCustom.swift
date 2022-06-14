//
//  ButtonCustom.swift
//  Quiz for ITパスポート
//
//  Created by 上條栞汰 on 2022/06/14.
//

import UIKit

class BottonCustom: UIControl {
    
    private let titleLabel = UILabel()
    private let button = UIButton()
    
    private func setupButton() {
        titleLabel.font = UIFont.preferredFont(forTextStyle: .headline)
        titleLabel.adjustsFontSizeToFitWidth = true
        titleLabel.numberOfLines = 0
        titleLabel.textAlignment = .center
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        [
            titleLabel.topAnchor.constraint(equalTo: topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor),
            titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor),
            titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor)
        ]
            .forEach { $0.isActive = true }
        
       
    }
}
