//
//  CanvasViewController.swift
//  iLexi
//
//  Created by Yury Buslovsky on 14.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit
import SwiftUI

// MARK: - Declaration

struct CanvasVC<VC: UIViewController> {

    private let viewController: VC

    init(_ factory: DefaultFactoryBlock<VC>) {
        viewController = factory()
    }

}

// MARK: - UIViewControllerRepresentable

extension CanvasVC: UIViewControllerRepresentable {

    func makeUIViewController(context: Context) -> VC {
        viewController
    }

    func updateUIViewController(_ uiViewController: VC, context: Context) {}

}
