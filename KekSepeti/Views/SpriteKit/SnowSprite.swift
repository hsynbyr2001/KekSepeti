//
//  SnowSprite.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 2.01.2025.
//

import SpriteKit

class GameScene: SKScene {
    let snow = SKEmitterNode(fileNamed: "Snow")
    override func didMove(to view: SKView) {
        backgroundColor = .black.withAlphaComponent(0)
        snow?.position = CGPoint(x: 200, y: 500)
        snow?.alpha = 0.3
        addChild(snow!)
    }
}
