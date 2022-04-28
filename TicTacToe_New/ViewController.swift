//
//  ViewController.swift
//  TicTacToe_New
//
//  Created by Edgar Arakelyan on 26.04.22.
//

import UIKit

class ViewController: UIViewController {
    var squareView: SquareView!
    var currentPlayer = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        initView()
        initConstraints()
    }
}


extension ViewController {
    
    fileprivate func initView() {
        squareView = SquareView()
        squareView.backgroundColor = .systemBlue
        squareView.layer.cornerRadius = 10
        squareView.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(squareView)
    }
    
    
    fileprivate func initConstraints() {
        NSLayoutConstraint.activate([
            squareView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            squareView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            squareView.widthAnchor.constraint(equalToConstant: 100),
            squareView.heightAnchor.constraint(equalToConstant: 100)
        ])
    }
}
