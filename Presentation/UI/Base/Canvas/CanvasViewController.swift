//
//  CanvasViewController.swift
//  UI
//
//  Created by Yury Buslovsky on 30.09.2020.
//

import Core
import UIKit
import SwiftUI

// MARK: - Declaration

public struct CanvasViewController<VC: UIViewController> {

    private let viewController: VC

    public init(_ factory: DefaultFactoryBlock<VC>) {
        viewController = factory()
    }

}

// MARK: - UIViewControllerRepresentable

extension CanvasViewController: UIViewControllerRepresentable {

    public func makeUIViewController(context: Context) -> VC {
        viewController
    }

    public func updateUIViewController(_ uiViewController: VC, context: Context) {}

}
