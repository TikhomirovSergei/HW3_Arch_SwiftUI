//
//  AppState.swift
//  HW3_Arch_SwiftUI
//
//  Created by Сергей on 22/12/2019.
//  Copyright © 2019 digt. All rights reserved.
//

import UIKit

class AppState {
    
    static var shared = AppState()
    
    var mainWindow: UIWindow?
    var overlayWindow: UIWindow?
    
    private init() {}
    
    func toggleOverlay() {
        if let overlayWindow = overlayWindow {
            if overlayWindow.isKeyWindow {
                mainWindow?.makeKeyAndVisible()
                overlayWindow.isHidden = true
            } else {
                overlayWindow.isHidden = false
                overlayWindow.makeKeyAndVisible()
            }
            
        }
    }
    
    
}
