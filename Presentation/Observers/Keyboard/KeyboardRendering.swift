//
//  KeyboardRendering.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 24.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import Foundation
import CoreGraphics

protocol KeyboardRendering {
    func moveContentForDismissedKeyboard(animationDuration: TimeInterval)
    func moveContent(forKeyboardFrame frame: CGRect, animationDuration: TimeInterval)
}
