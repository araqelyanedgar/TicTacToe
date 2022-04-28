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
    var isValueSet = false
    
    init() {
        super.init(frame: .zero)
        activateView()
        squareButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func activateView() {
        initSquareLabel()
        initSquareButton()
        activateLabel()
        activateConstraints()
    }
    
    var count = 0
    
    @objc private func buttonPressed() {
        onButtonSelection?()
    }
}

extension SquareView {
    
    fileprivate func initSquareLabel() {
        squareLabel = UILabel()
        squareLabel.textColor = .white
        squareLabel.text = "X"
        squareLabel.font = .systemFont(ofSize: 55)
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
