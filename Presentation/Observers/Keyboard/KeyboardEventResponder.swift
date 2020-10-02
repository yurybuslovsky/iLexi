//
//  KeyboardEventResponder.swift
//  Observers
//
//  Created by Yury Buslovsky on 02.10.2020.
//

public protocol KeyboardEventResponder: class {
    associatedtype Renderer

    var renderer: Renderer { get }

    func keyboardWillShow(_ userInfo: Keyboard.UserInfo)
    func keyboardDidShow(_ userInfo: Keyboard.UserInfo)
    func keyboardWillHide(_ userInfo: Keyboard.UserInfo)
    func keyboardDidHide(_ userInfo: Keyboard.UserInfo)
    func keyboardWillChangeFrame(_ userInfo: Keyboard.UserInfo)
    func keyboardDidChangeFrame(_ userInfo: Keyboard.UserInfo)
}

public extension KeyboardEventResponder {

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
