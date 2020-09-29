//
//  KeyboardEventResponder.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 24.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

protocol KeyboardEventResponder: class {
    associatedtype Renderer

    var renderer: Renderer { get }

    func keyboardWillShow(_ userInfo: Keyboard.UserInfo)
    func keyboardDidShow(_ userInfo: Keyboard.UserInfo)
    func keyboardWillHide(_ userInfo: Keyboard.UserInfo)
    func keyboardDidHide(_ userInfo: Keyboard.UserInfo)
    func keyboardWillChangeFrame(_ userInfo: Keyboard.UserInfo)
    func keyboardDidChangeFrame(_ userInfo: Keyboard.UserInfo)
}

extension KeyboardEventResponder {

    private var keyboardRenderer: Keyboard.Rendering? {
        renderer as? Keyboard.Rendering
    }

    func keyboardWillShow(_ userInfo: Keyboard.UserInfo) {}
    func keyboardDidShow(_ userInfo: Keyboard.UserInfo) {}

    func keyboardWillHide(_ userInfo: Keyboard.UserInfo) {
        keyboardRenderer?.moveContentForDismissedKeyboard(animationDuration: userInfo.animationDuration)
    }

    func keyboardDidHide(_ userInfo: Keyboard.UserInfo) {}

    func keyboardWillChangeFrame(_ userInfo: Keyboard.UserInfo) {
        keyboardRenderer?.moveContent(
            forKeyboardFrame: userInfo.endFrame,
            animationDuration: userInfo.animationDuration
        )
    }

    func keyboardDidChangeFrame(_ userInfo: Keyboard.UserInfo) {}

}
