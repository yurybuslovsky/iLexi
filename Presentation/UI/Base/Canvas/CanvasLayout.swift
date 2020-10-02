//
//  CanvasLayout.swift
//  UI
//
//  Created by Yury Buslovsky on 30.09.2020.
//

import UIKit

public enum CanvasLayout {
    case `default`
    case fixedWidth(CGFloat = UIScreen.main.bounds.width)
    case fixedHeight(CGFloat)
}
