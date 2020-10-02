//
//  KeyboardRendering.swift
//  Observers
//
//  Created by Yury Buslovsky on 02.10.2020.
//

import Foundation
import CoreGraphics

public protocol KeyboardRendering {
    func moveContentForDismissedKeyboard(animationDuration: TimeInterval)
    func moveContent(forKeyboardFrame frame: CGRect, animationDuration: TimeInterval)
}
