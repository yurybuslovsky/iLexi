//
//  CanvasLayout.swift
//  iLexi
//
//  Created by Yury Buslovsky on 14.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit

enum CanvasLayout {
    case `default`
    case fixedWidth(CGFloat = UIScreen.main.bounds.width)
    case fixedHeight(CGFloat)
}
