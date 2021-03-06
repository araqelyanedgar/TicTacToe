//
//  SquareView.swift
//  TicTacToe_New
//
//  Created by Edgar Arakelyan on 26.04.22.
//

import Foundation
import UIKit

class SquareView: UIView {
    var squareButton: UIButton!
    var squareLabel: UILabel!
    var onButtonSelection: (() -> Void)?
    var isValueSet: Bool = false
    
    init() {
        super.init(frame: .zero)
        activateView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func activateView() {
        initSquareLabel()
        initSquareButton()
        activateLabel()
        activateConstraints()
        
        squareButton.addTarget(self, action: #selector(buttonPressed),for: .touchUpInside)
    }
    
    @objc private func buttonPressed() {
        onButtonSelection?()
    }
    
    func set(value: String) {
        if !isValueSet {
            squareLabel.text = value
        }
            isValueSet = true
    }
    
    func clearData() {
        isValueSet = false
        squareLabel.text = ""
    }
}

extension SquareView {
    fileprivate func initSquareLabel() {
        squareLabel = UILabel()
        squareLabel.textColor = .black
        squareLabel.font = .systemFont(ofSize: 75)
        squareLabel.textAlignment = .center
        squareLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func initSquareButton() {
        squareButton = UIButton()
        squareButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func activateLabel() {
        addSubview(squareLabel)
        addSubview(squareButton)
    }
    
    fileprivate func activateConstraints() {
        NSLayoutConstraint.activate([
            squareButton.topAnchor.constraint(equalTo: topAnchor),
            squareButton.trailingAnchor.constraint(equalTo: trailingAnchor),
            squareButton.bottomAnchor.constraint(equalTo: bottomAnchor),
            squareButton.leadingAnchor.constraint(equalTo: leadingAnchor),
            
            squareLabel.topAnchor.constraint(equalTo: squareButton.topAnchor),
            squareLabel.trailingAnchor.constraint(equalTo: squareButton.trailingAnchor),
            squareLabel.bottomAnchor.constraint(equalTo: squareButton.bottomAnchor),
            squareLabel.leadingAnchor.constraint(equalTo: squareButton.leadingAnchor)
        ])
    }
}
