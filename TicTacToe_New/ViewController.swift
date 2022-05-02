//
//  ViewController.swift
//  TicTacToe_New
//
//  Created by Edgar Arakelyan on 26.04.22.
//

import UIKit

class ViewController: UIViewController {
    var mainStackView: UIStackView!
    var gameTitleLabel: UILabel!
    var resetButton: UIButton!
    var currentPlayer: Bool = true
    var squareViews: [SquareView] = []
    var gameArray: [[String]] = []
    var xWinsMessage = UIAlertController(title: "Game Over", message: "\"X\" Wins", preferredStyle: .alert)
    var oWinsMessage = UIAlertController(title: "Game Over", message: "\"O\" Wins", preferredStyle: .alert)
    let playAgain = UIAlertAction(title: "OK", style: .default, handler: { (action) -> Void in
//        print("Ok button tapped") resetButtonTapped()
    })
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        initStackView()
        initGameTitleLabel()
        initResetButton()
        initView()
        initConstraints()
        
        createSquareGrid(size: 1...3)
        resetButton.addTarget(self, action: #selector(resetButtonTapped), for: .touchUpInside)
        xWinsMessage.addAction(playAgain)
        oWinsMessage.addAction(playAgain)
        
    }
    
    func createSquareGrid(size: ClosedRange<Int>) {
        for i in size {
            let stackView = createHorizontalStackView()
            mainStackView.addArrangedSubview(stackView)
            gameArray.append([])
            
            for j in size {
                let squareView = SquareView()
                gameArray[i-1].append("")
                
                squareView.onButtonSelection = {
                    
                    if squareView.isValueSet {
                        return
                    }
                    
                    if self.currentPlayer {
                        self.gameArray[i-1][j-1] = "X"
                        squareView.set(value: "X")
                        if self.gameArray.contains(["X", "X", "X"]) ||
                            (
                                self.gameArray[0][0] == "X" &&
                                self.gameArray[1][0] == "X" &&
                                self.gameArray[2][0] == "X"
                            )                                       ||
                            (
                                self.gameArray[0][1] == "X" &&
                                self.gameArray[1][1] == "X" &&
                                self.gameArray[2][1] == "X"
                            )                                       ||
                            (
                                self.gameArray[0][2] == "X" &&
                                self.gameArray[1][2] == "X" &&
                                self.gameArray[2][2] == "X"
                            )                                       ||
                            (
                                self.gameArray[0][0] == "X" &&
                                self.gameArray[1][1] == "X" &&
                                self.gameArray[2][2] == "X"
                            )                                       ||
                            (
                                self.gameArray[0][2] == "X" &&
                                self.gameArray[1][1] == "X" &&
                                self.gameArray[2][0] == "X"
                            )
                        {
                            
                            self.present(self.xWinsMessage, animated: true, completion: nil)
                        }
                    } else {
                        self.gameArray[i-1][j-1] = "O"
                        squareView.set(value: "O")
                        if self.gameArray.contains(["O", "O", "O"]) ||
                            (
                                self.gameArray[0][0] == "O" &&
                                self.gameArray[1][0] == "O" &&
                                self.gameArray[2][0] == "O"
                            )                                       ||
                            (
                                self.gameArray[0][1] == "O" &&
                                self.gameArray[1][1] == "O" &&
                                self.gameArray[2][1] == "O"
                            )                                       ||
                            (
                                self.gameArray[0][2] == "O" &&
                                self.gameArray[1][2] == "O" &&
                                self.gameArray[2][2] == "O"
                            )                                       ||
                            (
                                self.gameArray[0][0] == "O" &&
                                self.gameArray[1][1] == "O" &&
                                self.gameArray[2][2] == "O"
                            )                                       ||
                            (
                                self.gameArray[0][2] == "O" &&
                                self.gameArray[1][1] == "O" &&
                                self.gameArray[2][0] == "O"
                            )
                        {
                            self.present(self.oWinsMessage, animated: true, completion: nil)
                        }
                    }
                    self.currentPlayer.toggle()
                }
                
                squareViews.append(squareView)
                
                let height = (Int(view.frame.width) - 2 - (size.upperBound - 1)*5)/size.upperBound
                
                NSLayoutConstraint.activate([
                    squareView.heightAnchor.constraint(equalToConstant: CGFloat(height))
                ])
                
                stackView.addArrangedSubview(squareView)
                squareView.backgroundColor = .white
            }
        }
    }
    
    @objc private func resetButtonTapped() {
        squareViews.forEach({ $0.clearData() })
        gameArray = [["", "", ""], ["", "", ""], ["", "", ""]]
        currentPlayer = true
    }
}

func createHorizontalStackView() -> UIStackView {
    let stackView = UIStackView()
    stackView.axis = .horizontal
    stackView.spacing = 1
    stackView.distribution = .fillEqually
    return stackView
}

extension ViewController {
    fileprivate func initStackView() {
        mainStackView = UIStackView()
        mainStackView.backgroundColor = .black
        mainStackView.axis = .vertical
        mainStackView.spacing = 1
        mainStackView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func initGameTitleLabel() {
        gameTitleLabel = UILabel()
        gameTitleLabel.text = "TicTacToe"
        gameTitleLabel.font = UIFont.boldSystemFont(ofSize: 50)
        gameTitleLabel.textColor = .black
        gameTitleLabel.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func initResetButton() {
        resetButton = UIButton(type: .system)
        resetButton.setTitle("NEW GAME", for: .normal)
        resetButton.setTitleColor(.white, for: .normal)
        resetButton.backgroundColor = .black
        resetButton.layer.cornerRadius = 10
        resetButton.translatesAutoresizingMaskIntoConstraints = false
    }
    
    fileprivate func initView() {
        view.addSubview(mainStackView)
        view.addSubview(gameTitleLabel)
        view.addSubview(resetButton)
    }
    
    fileprivate func initConstraints() {
        NSLayoutConstraint.activate([
            mainStackView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            mainStackView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            mainStackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 25),
            mainStackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -25),
            
            gameTitleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            gameTitleLabel.bottomAnchor.constraint(equalTo: mainStackView.topAnchor, constant: -50),
            
            resetButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            resetButton.topAnchor.constraint(equalTo: mainStackView.bottomAnchor, constant: 50),
            resetButton.heightAnchor.constraint(equalToConstant: 50),
            resetButton.widthAnchor.constraint(equalToConstant: 150)
        ])
    }
}
