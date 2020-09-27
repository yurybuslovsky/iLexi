//
//  CanvasLayoutWrapperView.swift
//  iLexi
//
//  Created by Yury Buslovsky on 14.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import UIKit
import SnapKit

// MARK: - Base

final class CanvasLayoutWrapperView: NiblessView {

    private let wrappedView: UIView
    private let canvasLayout: CanvasLayout
    private var wrappedViewIntrinsicContentSize: CGSize?

    init(canvasLayout: CanvasLayout, wrappedView: UIView) {
        self.wrappedView = wrappedView
        self.canvasLayout = canvasLayout
        super.init(frame: .zero)

        pinWrappedViewToEdges()
        self.wrappedViewIntrinsicContentSize = calculateWrappedViewSize()
    }

    override func invalidateIntrinsicContentSize() {
        wrappedViewIntrinsicContentSize = calculateWrappedViewSize()
    }

    override var intrinsicContentSize: CGSize {
        wrappedViewIntrinsicContentSize ?? super.intrinsicContentSize
    }

}

// MARK: - Private API

extension CanvasLayoutWrapperView {

    private func pinWrappedViewToEdges() {
        addSubview(wrappedView)

        wrappedView.snp.makeConstraints { (make: ConstraintMaker) in
            make.edges.equalTo(snp.edges)
        }
    }

    private func calculateWrappedViewSize() -> CGSize {
        switch canvasLayout {
        case let .fixedHeight(height):
            return wrappedView.systemLayoutSizeFitting(
                CGSize(width: .greatestFiniteMagnitude, height: height),
                withHorizontalFittingPriority: .fittingSizeLevel,
                verticalFittingPriority: .required
            )

        case let .fixedWidth(width):
            return wrappedView.systemLayoutSizeFitting(
                CGSize(width: width, height: .greatestFiniteMagnitude),
                withHorizontalFittingPriority: .required,
                verticalFittingPriority: .fittingSizeLevel
            )

        case .default:
            return wrappedView.intrinsicContentSize
        }
    }

}
