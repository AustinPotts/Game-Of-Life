//
//  GameBoardView.swift
//  Game-Of-Life-iOS
//
//  Created by Austin Potts on 6/25/20.
//  Copyright © 2020 Lambda School. All rights reserved.
//

import SwiftUI


enum GameBoardViewState {
    case running, stopped
}

class GameBoardView: UIView {
    var life: Life = Life(size: 0)
    var cellSize = 40
    
    var state: GameBoardViewState = .running
    
    convenience init(lifeSize: Int, cellSize: Int) {
        let frame = CGRect(x: 0, y: 0, width: lifeSize * lifeSize, height: lifeSize * lifeSize)
        self.init(frame: frame)
        self.life = Life(size: lifeSize)
        self.cellSize = cellSize
        contentMode = .redraw
    }
    
    convenience init() {
        let frame = CGRect(x: 0, y: 0, width: 1000, height: 1000)
        self.init(frame: frame)
        contentMode = .redraw
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentMode = .redraw
    }
    
    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // Cell Creation
    override func draw(_ rect: CGRect) {
        let context = UIGraphicsGetCurrentContext()
        context?.saveGState()
        for cell in life.cells {
            let rect = CGRect(x: cell.x * cellSize, y: cell.y * cellSize, width: cellSize, height: cellSize)
            let color = cell.state == .alive ? UIColor(patternImage: UIImage(named: "cellImage.png") ?? UIImage()).cgColor : UIColor(patternImage: UIImage(named: "background2.png") ?? UIImage()).cgColor
            context?.addRect(rect)
            context?.setFillColor(color)
            context?.fill(rect)
        }
        context?.restoreGState()
    }
    
    func autoRun() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
            if self.state == .running {
                self.life.updateCells()
                self.setNeedsDisplay()
                self.autoRun()
            }
        }
    }
}

struct GameBoardView_Previews: PreviewProvider {
    static var previews: some View {
        /*@START_MENU_TOKEN@*/Text("Hello, World!")/*@END_MENU_TOKEN@*/
    }
}
