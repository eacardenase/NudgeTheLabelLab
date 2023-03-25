//
//  Factory.swift
//  NudgeTheLabelLab
//
//  Created by Edwin Cardenas on 3/25/23.
//

import UIKit

class Factory {
    static func makeStackView(withOrientation axis: NSLayoutConstraint.Axis) -> UIStackView {
        let stackView = UIStackView()
        
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = axis
        stackView.distribution = .fill
        stackView.alignment = .fill
        stackView.spacing = 8.0
        
        return stackView
    }
}
