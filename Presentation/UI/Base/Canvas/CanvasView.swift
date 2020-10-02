//
//  CanvasView.swift
//  UI
//
//  Created by Yury Buslovsky on 30.09.2020.
//

import Core
import UIKit
import SwiftUI

// MARK: - Base

public struct CanvasView<V: UIView> {

    private let wrappedView: CanvasLayoutWrapperView

    public init(
        canvasLayout: CanvasLayout = .default,
        _ factory: DefaultFactoryBlock<V>
    ) {
        wrappedView = CanvasLayoutWrapperView(
            canvasLayout: canvasLayout,
            wrappedView: factory()
        )
    }

}

// MARK: - UIViewRepresentable

extension CanvasView: UIViewRepresentable {

    public func makeUIView(context: Context) -> UIView {
        wrappedView.invalidateIntrinsicContentSize()
        return wrappedView
    }

    public func updateUIView(_ uiView: UIView, context: Context) {
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        uiView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }

}
