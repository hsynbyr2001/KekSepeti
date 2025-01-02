//
//  SnowView.swift
//  KekSepeti
//
//  Created by Hüseyin  Bayır on 2.01.2025.
//

import SwiftUI
import SpriteKit

struct SnowView: View {
    var body: some View {
        SpriteView(scene: createGameScene(), options: [.allowsTransparency])
            .ignoresSafeArea()
    }
    
    func createGameScene() -> SKScene {
        let scene = GameScene(size: CGSize(width: 300, height: 500))
        scene.scaleMode = .aspectFill
        return scene
    }
}


#Preview {
    SnowView()
}
