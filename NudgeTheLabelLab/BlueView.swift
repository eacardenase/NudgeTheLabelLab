//
//  BlueView.swift
//  NudgeTheLabelLab
//
//  Created by Edwin Cardenas on 3/25/23.
//

import UIKit

class BlueView: UIView {
    
    var topAnchorConstraint = NSLayoutConstraint()
    var centerYAnchorConstraint = NSLayoutConstraint()
    
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
        
        let label = UILabel()
        
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Adjusting constraints"
        label.font = UIFont.systemFont(ofSize: 24)
        label.backgroundColor = .yellow
        
        addSubview(label)
        
        // static constraint
        label.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        
        // dynamic constraints
        topAnchorConstraint = label.topAnchor.constraint(equalTo: topAnchor, constant: 8)
        centerYAnchorConstraint = label.centerYAnchor.constraint(equalTo: centerYAnchor)
        
        adjustConstraints()
    }
    
    func adjustConstraints() {
        
        guard let orientation = window?.windowScene?.interfaceOrientation else { return }

        if orientation.isPortrait {
            topAnchorConstraint.isActive = true
            centerYAnchorConstraint.isActive = false
        } else {
            topAnchorConstraint.isActive = false
            centerYAnchorConstraint.isActive = true
        }
    }
}
