//
//  AboutDetailsViewController.swift
//  Game-Of-Life-iOS
//
//  Created by Austin Potts on 6/25/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import UIKit

class AboutDetailsViewController: UIViewController {

  let rulesLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "Rules"
            label.textColor = .red
            label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
            return label
        }()
        
        let rule1Label: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "• Any live cell with less than 2 neighbors will die"
            label.numberOfLines = 0
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            return label
        }()
        
        let rule2Label: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "• Any live cell with 2 or 3 neighbors will live for the next generation"
            label.numberOfLines = 0
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            return label
        }()
        
        let rule3Label: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "• Any live cell with more then 3 neighbors will die"
            label.numberOfLines = 0
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            return label
        }()
        
        let rule4Label: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "• Any dead cell with exactly 3 neighbors will become a live cell"
            label.numberOfLines = 0
            label.textColor = .white
            label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            return label
        }()
        
        let aboutAlgoLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "About The Algorithm"
            label.textColor =  UIColor(patternImage: UIImage(named: "cellImage.png") ?? UIImage())
            label.font = UIFont.systemFont(ofSize: 40, weight: .bold)
            return label
        }()
        
        let aboutAlgoTextView: UITextView = {
            let textView = UITextView()
            textView.translatesAutoresizingMaskIntoConstraints = false
            textView.isUserInteractionEnabled = false
            textView.isEditable = false
            textView.backgroundColor = .black
            textView.text =
            """
            This was a completley new concept to me, as I had never heard of John Conways "Game of Life".
            At first I researched the man behind the game, John Conway, an English mathematician active in the theory of finite groups, knot theory, number theory, combinatorial game theory and coding theory. He came up with this simple concept, that given a set of simple rules, a cell can handle it's own state. The result of that process is an automated cell that when combined with other cells, creates some interesting geometric shapes. In computability theory, a system of data-manipulation rules is said to be Turing-complete or computationally universal if it can be used to simulate any Turing machine. This means that this system is able to recognize or decide other data-manipulation rule sets.
            """
            textView.textColor = .white
            textView.font = UIFont.systemFont(ofSize: 15, weight: .semibold)
            return textView
        }()
        
        let dateLabel: UILabel = {
            let label = UILabel()
            label.translatesAutoresizingMaskIntoConstraints = false
            label.text = "June 2020"
            label.numberOfLines = 0
            label.textColor = .label
            label.font = UIFont.systemFont(ofSize: 20, weight: .semibold)
            return label
        }()
        
        override func viewDidLoad() {
            super.viewDidLoad()
            setupUI()
        }
        
        private func setupUI() {
            title = "About"
            view.backgroundColor = .black
            navigationController?.navigationBar.tintColor = .label
            view.addSubview(rulesLabel)
            view.addSubview(rule1Label)
            view.addSubview(rule2Label)
            view.addSubview(rule3Label)
            view.addSubview(rule4Label)
            view.addSubview(aboutAlgoLabel)
            view.addSubview(aboutAlgoTextView)
            view.addSubview(dateLabel)
            NSLayoutConstraint.activate([
                rulesLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                rulesLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 0),
                
                rule1Label.leadingAnchor.constraint(equalTo: rulesLabel.leadingAnchor, constant: 16),
                rule1Label.topAnchor.constraint(equalTo: rulesLabel.bottomAnchor, constant: 16),
                rule1Label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
                
                rule2Label.leadingAnchor.constraint(equalTo: rulesLabel.leadingAnchor, constant: 16),
                rule2Label.topAnchor.constraint(equalTo: rule1Label.bottomAnchor, constant: 16),
                rule2Label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
                
                rule3Label.leadingAnchor.constraint(equalTo: rulesLabel.leadingAnchor, constant: 16),
                rule3Label.topAnchor.constraint(equalTo: rule2Label.bottomAnchor, constant: 16),
                rule3Label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
                
                rule4Label.leadingAnchor.constraint(equalTo: rulesLabel.leadingAnchor, constant: 16),
                rule4Label.topAnchor.constraint(equalTo: rule3Label.bottomAnchor, constant: 16),
                rule4Label.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -8),
                
                aboutAlgoLabel.leadingAnchor.constraint(equalTo: rulesLabel.leadingAnchor),
                aboutAlgoLabel.topAnchor.constraint(equalTo: rule4Label.bottomAnchor, constant: 10),
                
                aboutAlgoTextView.topAnchor.constraint(equalTo: aboutAlgoLabel.bottomAnchor, constant: 1),
                aboutAlgoTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16),
                aboutAlgoTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16),
                aboutAlgoTextView.bottomAnchor.constraint(equalTo: dateLabel.topAnchor, constant: -1),
                
                dateLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
                dateLabel.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        }

      

    }
