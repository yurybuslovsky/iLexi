//
//  EntryInfoView.swift
//  UI_iOS
//
//  Created by Yury Buslovsky on 02.10.2020.
//

import Core
import UI
import UIKit
import SnapKit
import RxSwift
import RxCocoa
import NSObject_Rx
import SwiftUI

// MARK: - Auxiliary

private typealias EntryInfo = iOSApp.EntryInfo
private typealias View = EntryInfo.View

extension View {
    typealias L10n = Core.L10n.EntryInfo
}

// MARK: - Constants

extension View {
    private static var padding: CGFloat { 15 }
    private static var titleBottomSpacing: CGFloat { 20 }
    private static var enrtyTextFieldWidth: CGFloat { 200 }
    private static var enrtyTextFieldMinBottomSpacing: CGFloat { 20 }
}

// MARK: - Declaration

public extension EntryInfo {

    final class View: NiblessView, Rendering {

        // MARK: • Responder

        public weak var ixResponder: IXResponder?

        // MARK: • Subviews

        private lazy var cancelButton: UIButton = {
            let cancelButton = UIButton()
            cancelButton.setTitleColor(.systemBlue, for: .normal)
            cancelButton.setTitle(L10n.Button.cancel, for: .normal)
            cancelButton.setAction { [unowned self] in self.cancel() }
            addSubview(cancelButton)
            return cancelButton
        }()

        private lazy var saveButton: UIButton = {
            let saveButton = UIButton()
            saveButton.setTitleColor(.systemBlue, for: .normal)
            saveButton.setTitleColor(.systemGray, for: .disabled)
            saveButton.setTitle(L10n.Button.save, for: .normal)
            saveButton.setAction { [unowned self] in self.save() }
            addSubview(saveButton)
            return saveButton
        }()

        private lazy var titleLabel: UILabel = {
            let titleLabel = UILabel()
            titleLabel.font = .systemFont(ofSize: 24, weight: .semibold)
            titleLabel.text = L10n.title
            titleLabel.textColor = Assets.primaryText.color
            addSubview(titleLabel)
            return titleLabel
        }()

        private lazy var entryTextField: UITextField = {
            let entryTextField = UITextField()
            entryTextField.borderStyle = .roundedRect
            entryTextField.placeholder = L10n.textFieldPlaceholder
            addSubview(entryTextField)
            return entryTextField
        }()

        // MARK: • Constraints

        private var entryTextFieldCenterConstraint: Constraint!

        // MARK: • Initialization

        public override init() {
            super.init()
            setUpConstaints()
            bindObservables()
        }

    }

}

// MARK: - Private API

extension View {

    private func setUpConstaints() {
        let padding = Self.padding

        cancelButton.snp.makeConstraints { (make: ConstraintMaker) in
            make.top.left.equalToSuperview().inset(padding)
        }

        saveButton.snp.makeConstraints { (make: ConstraintMaker) in
            make.centerY.equalTo(cancelButton)
            make.trailing.equalToSuperview().inset(padding)
        }

        titleLabel.snp.makeConstraints { (make: ConstraintMaker) in
            make.centerX.equalTo(entryTextField)
            make.bottom.equalTo(entryTextField.snp.top).offset(-Self.titleBottomSpacing)
        }

        entryTextField.snp.makeConstraints { (make: ConstraintMaker) in
            self.entryTextFieldCenterConstraint = make.center.equalToSuperview().constraint
            make.width.equalTo(Self.enrtyTextFieldWidth)
        }
    }

    private func bindObservables() {
        entryTextField.rx.text.orEmpty
            .map(\.isEmpty)
            .map(!)
            .bind(to: saveButton.rx.isEnabled)
            .disposed(by: rx.disposeBag)
    }

}

// MARK: - Interactions

extension View {

    private func cancel() {
        ixResponder?.dismiss()
    }

    private func save() {
        ixResponder?.addEntry(withValue: entryTextField.text.orEmpty)
    }

}

// MARK: - Rendering

extension View {

    public func moveContentForDismissedKeyboard(animationDuration: TimeInterval) {
        UIView.animate(withDuration: animationDuration) {
            self.entryTextFieldCenterConstraint.zeroOut()
        }
    }

    public func moveContent(forKeyboardFrame frame: CGRect, animationDuration: TimeInterval) {
        let originalMaxY = entryTextField.frame.maxY
        let minRequiredBottomSpacing = frame.height + Self.enrtyTextFieldMinBottomSpacing
        let minRequiredMaxY = bounds.height - minRequiredBottomSpacing
        let newMaxY = min(originalMaxY, minRequiredMaxY)
        let shift = newMaxY - originalMaxY

        UIView.animate(withDuration: animationDuration) {
            self.entryTextFieldCenterConstraint.update(offset: shift)
        }
    }

}

// MARK: - Canvas

#if DEBUG

struct EntryInfoView_Previews: PreviewProvider {

    static var previews: some SwiftUI.View {
        Group {
            CanvasView {
                let view = View()
                return view
            }
            .previewLayout(.sizeThatFits)
        }
    }

}

#endif
