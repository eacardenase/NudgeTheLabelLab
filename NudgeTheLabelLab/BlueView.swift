//
//  BlueView.swift
//  NudgeTheLabelLab
//
//  Created by Edwin Cardenas on 3/25/23.
//

import UIKit

class BlueView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override var intrinsicContentSize: CGSize {
        CGSize(width: 200, height: 200)
    }
}

extension BlueView {
    func setupViews() {
        backgroundColor = .blue
    }
}
