//
//  ViewController.swift
//  NudgeTheLabelLab
//
//  Created by Edwin Cardenas on 3/25/23.
//

import UIKit

class ViewController: UIViewController {
    
    var stackView: UIStackView
    let blueView = BlueView()

    init() {
        stackView = Factory.makeStackView(withOrientation: .vertical)
        
        super.init(nibName: nil, bundle: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        registerForOrientationChanges()
        setupViews()
    }
}

extension ViewController {
    func registerForOrientationChanges() {
        NotificationCenter.default.addObserver(self, selector: #selector(ViewController.rotated), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    
    func setupViews() {
        let redView = RedView()
        
        stackView.addArrangedSubview(redView)
        stackView.addArrangedSubview(blueView)
        
        view.addSubview(stackView)
        
        redView.heightAnchor.constraint(equalTo: blueView.heightAnchor).isActive = true
        redView.widthAnchor.constraint(equalTo: blueView.widthAnchor).isActive = true
        
        NSLayoutConstraint.activate([
            stackView.topAnchor.constraint(equalTo: view.topAnchor),
            stackView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
    }
    
    @objc func rotated() {
        if UIDevice.current.orientation.isLandscape {
            stackView.axis = .horizontal
        } else {
            stackView.axis = .vertical
        }
        
        blueView.adjustConstraints()
    }
}
