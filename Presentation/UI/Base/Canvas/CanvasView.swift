//
//  CanvasView.swift
//  iLexi
//
//  Created by Yury Buslovsky on 14.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import Core
import UIKit
import SwiftUI

// MARK: - Base

struct CanvasView<V: UIView> {

    private let wrappedView: CanvasLayoutWrapperView

    init(
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

    func makeUIView(context: Context) -> UIView {
        wrappedView.invalidateIntrinsicContentSize()
        return wrappedView
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        uiView.setContentHuggingPriority(.defaultHigh, for: .vertical)
        uiView.setContentHuggingPriority(.defaultHigh, for: .horizontal)
    }

}
