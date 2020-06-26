//
//  ViewController.swift
//  Game-Of-Life-iOS
//
//  Created by Austin Potts on 6/22/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import SwiftUI
import UIKit

class GameViewController: UIViewController {
    lazy var gameBoardView: GameBoardView = {
        let view = GameBoardView(lifeSize: 300, cellSize: 10)
        view.translatesAutoresizingMaskIntoConstraints = false
        view.isUserInteractionEnabled = true
        view.backgroundColor = .blue
        view.clipsToBounds = false
        return view
    }()
    
    
    let playButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold),
            NSAttributedString.Key.foregroundColor: UIColor.systemBackground
        ]
        button.setAttributedTitle(NSAttributedString(string: "Play", attributes: attributes), for: .normal)
        button.addTarget(self, action: #selector(runGame), for: .touchUpInside)
        button.backgroundColor = UIColor(hue: 0.35, saturation: 0.66, brightness: 0.66, alpha: 1)
        button.layer.cornerRadius = 8
        return button
    }()
    
    let randomButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold),
            NSAttributedString.Key.foregroundColor: UIColor.systemBackground
        ]
        button.setAttributedTitle(NSAttributedString(string: "Random", attributes: attributes), for: .normal)
        button.addTarget(self, action: #selector(randomGame), for: .touchUpInside)
        button.backgroundColor = UIColor(hue: 0.75, saturation: 0.66, brightness: 0.66, alpha: 1)
        button.layer.cornerRadius = 8
        return button
    }()
    
    let stepButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold),
            NSAttributedString.Key.foregroundColor: UIColor.systemBackground
        ]
        button.setAttributedTitle(NSAttributedString(string: "Step", attributes: attributes), for: .normal)
        button.addTarget(self, action: #selector(stepGame), for: .touchUpInside)
        button.backgroundColor = UIColor(hue: 0.75, saturation: 0.66, brightness: 0.66, alpha: 1)
        button.layer.cornerRadius = 8
        return button
    }()
    
    let stopButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold),
            NSAttributedString.Key.foregroundColor: UIColor.systemBackground
        ]
        button.setAttributedTitle(NSAttributedString(string: "Stop", attributes: attributes), for: .normal)
        button.addTarget(self, action: #selector(stopGame), for: .touchUpInside)
        button.backgroundColor = .red
        button.layer.cornerRadius = 8
        return button
    }()
    
    let beaconButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold),
            NSAttributedString.Key.foregroundColor: UIColor.systemBackground
        ]
        button.setAttributedTitle(NSAttributedString(string: "BEACON", attributes: attributes), for: .normal)
        button.addTarget(self, action: #selector(presentBeacon), for: .touchUpInside)
        button.backgroundColor = UIColor(hue: 0.50, saturation: 0.66, brightness: 0.66, alpha: 1)
        button.layer.cornerRadius = 8
        return button
    }()
    
    let toadButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold),
            NSAttributedString.Key.foregroundColor: UIColor.systemBackground
        ]
        button.setAttributedTitle(NSAttributedString(string: "TOAD", attributes: attributes), for: .normal)
        button.addTarget(self, action: #selector(presentToad), for: .touchUpInside)
        button.backgroundColor = UIColor(hue: 0.50, saturation: 0.66, brightness: 0.66, alpha: 1)
        button.layer.cornerRadius = 8
        return button
    }()
    
    let pulsarButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold),
            NSAttributedString.Key.foregroundColor: UIColor.systemBackground
        ]
        button.setAttributedTitle(NSAttributedString(string: "PULSAR", attributes: attributes), for: .normal)
        button.addTarget(self, action: #selector(presentPulsar), for: .touchUpInside)
        button.backgroundColor = UIColor(hue: 0.50, saturation: 0.66, brightness: 0.66, alpha: 1)
        button.layer.cornerRadius = 8
        return button
    }()
    
    let gliderButton: UIButton = {
        let button = UIButton()
        button.translatesAutoresizingMaskIntoConstraints = false
        button.isUserInteractionEnabled = true
        let attributes = [
            NSAttributedString.Key.font: UIFont.systemFont(ofSize: 17, weight: .semibold),
            NSAttributedString.Key.foregroundColor: UIColor.systemBackground
        ]
        button.setAttributedTitle(NSAttributedString(string: "GLIDER", attributes: attributes), for: .normal)
        button.addTarget(self, action: #selector(presentGlider), for: .touchUpInside)
        button.backgroundColor = UIColor(hue: 0.50, saturation: 0.66, brightness: 0.66, alpha: 1)
        button.layer.cornerRadius = 8
        return button
    }()
    
    let outerStackView: UIStackView = {
        let stack = UIStackView()
        stack.translatesAutoresizingMaskIntoConstraints = false
        stack.axis = .vertical
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 40
        return stack
    }()
    
    let innerTopStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 70
        return stack
    }()
    
    let innerBottomStackView: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.alignment = .fill
        stack.distribution = .fillEqually
        stack.spacing = 70
        return stack
    }()
    
    let generationLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 17, weight: .regular)
        label.text = "Generation: 0"
        label.textColor = .white
        return label
    }()
    
    let titleLabel: UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints = false
        label.font = UIFont.systemFont(ofSize: 40, weight: .semibold)
        label.text = "Conways Game Of Life"
        label.textColor = .white
        return label
        
    }()
    
    
    var timer: CADisplayLink!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        // Set Up Nav Con
        setupNavController()
        NotificationCenter.default.addObserver(self, selector: #selector(updateGeneration), name: .generationChanged, object: nil)

        
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(patternImage: UIImage(named: "background2.png") ?? UIImage())
        view.addSubview(titleLabel)
        view.addSubview(generationLabel)
        view.addSubview(gameBoardView)
        view.addSubview(stepButton)
        view.addSubview(playButton)
        view.addSubview(randomButton)
        view.addSubview(stopButton)
        view.addSubview(outerStackView)
        outerStackView.addArrangedSubview(innerTopStackView)
        outerStackView.addArrangedSubview(innerBottomStackView)
        innerTopStackView.addArrangedSubview(beaconButton)
        innerTopStackView.addArrangedSubview(toadButton)
        innerBottomStackView.addArrangedSubview(pulsarButton)
        innerBottomStackView.addArrangedSubview(gliderButton)
        NSLayoutConstraint.activate([
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: -50),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            generationLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 20),
            generationLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            gameBoardView.topAnchor.constraint(equalTo: generationLabel.bottomAnchor, constant: 16),
            gameBoardView.widthAnchor.constraint(equalToConstant: 400),
            gameBoardView.heightAnchor.constraint(equalTo: gameBoardView.widthAnchor, multiplier: 1),
            gameBoardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            stepButton.topAnchor.constraint(equalTo: gameBoardView.bottomAnchor, constant: 40),
            stepButton.heightAnchor.constraint(equalToConstant: 40),
            stepButton.leadingAnchor.constraint(equalTo: gameBoardView.leadingAnchor),
            stepButton.widthAnchor.constraint(equalTo: gameBoardView.widthAnchor, multiplier: 0.3),
            
            playButton.topAnchor.constraint(equalTo: gameBoardView.bottomAnchor, constant: 20),
            playButton.heightAnchor.constraint(equalToConstant: 40),
            playButton.leadingAnchor.constraint(equalTo: stepButton.trailingAnchor, constant: 16),
            playButton.widthAnchor.constraint(equalTo: gameBoardView.widthAnchor, multiplier: 0.3),
            
            randomButton.topAnchor.constraint(equalTo: gameBoardView.bottomAnchor, constant: 40),
            randomButton.heightAnchor.constraint(equalToConstant: 40),
            randomButton.trailingAnchor.constraint(equalTo: gameBoardView.trailingAnchor),
            randomButton.widthAnchor.constraint(equalTo: gameBoardView.widthAnchor, multiplier: 0.3),
            
            
            stopButton.topAnchor.constraint(equalTo: playButton.bottomAnchor, constant: 30),
            stopButton.leadingAnchor.constraint(equalTo: playButton.leadingAnchor),
            stopButton.heightAnchor.constraint(equalToConstant: 40),
            stopButton.trailingAnchor.constraint(equalTo: playButton.trailingAnchor),
            
            outerStackView.topAnchor.constraint(equalTo: stopButton.bottomAnchor, constant: 20),
            outerStackView.leadingAnchor.constraint(equalTo: gameBoardView.leadingAnchor),
            outerStackView.trailingAnchor.constraint(equalTo: gameBoardView.trailingAnchor)
        ])
    }
    
    // Set Up Nav Controller
    private func setupNavController() {
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(
            image: UIImage(systemName: "info.circle"),
            style: .plain,
            target: self,
            action: #selector(presentAboutScreen)
        )
        navigationItem.rightBarButtonItem?.tintColor = .white
    }

    
    
    
    
    //MARK: Obj C Functions for Selectors
    @objc private func stepGame() {
        if gameBoardView.life.cells == [] {
            gameBoardView.life.createRandom()
        }
        gameBoardView.life.updateCells()
        gameBoardView.setNeedsDisplay()
    }
    
    @objc private func runGame() {
        gameBoardView.state = .running
        gameBoardView.autoRun()
    }
    
    @objc private func stopGame() {
        gameBoardView.state = .stopped
        gameBoardView.setNeedsDisplay()
    }
    
    @objc private func randomGame() {
        gameBoardView.life.createRandom()
        gameBoardView.state = .stopped
        gameBoardView.setNeedsDisplay()
    }
    
    
    @objc private func presentBeacon(){
        gameBoardView.life.createBeacon()
        gameBoardView.setNeedsDisplay()
        
    }
    
    @objc private func presentExplosion() {
        gameBoardView.life.createExplosion()
        gameBoardView.setNeedsDisplay()
    }
    
    @objc private func presentToad() {
        gameBoardView.life.createToad()
        gameBoardView.setNeedsDisplay()
    }
    
    @objc private func presentPulsar() {
        gameBoardView.life.createPulsar()
        gameBoardView.setNeedsDisplay()
    }
    
    @objc private func presentGlider() {
        gameBoardView.life.createGlider()
        gameBoardView.setNeedsDisplay()
    }
    
    // Set Up Presentation of About Screen
    @objc private func presentAboutScreen() {
              //FIXME
             let aboutGameVC = AboutDetailsViewController(nibName: nil, bundle: nil)
             navigationController?.pushViewController(aboutGameVC, animated: true)
          }
    
    
    @objc private func updateGeneration() {
        generationLabel.text = "Generation Count: \(gameBoardView.life.generation)"
    }
}

   
@available(iOS 13, *)
   struct AboutGamePreview: PreviewProvider {
       static var previews: some View {
           GameViewController().asPreview()
               .edgesIgnoringSafeArea(.all)
               .colorScheme(.dark)
       }
   }

extension Notification.Name {
    static let generationChanged = Notification.Name("generationChangedNotification")
}
