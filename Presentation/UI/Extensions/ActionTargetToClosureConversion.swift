//
//  ActionTargetToClosureConversion.swift
//  UI
//
//  Created by Yury Buslovsky on 30.09.2020.
//

import Core
import UIKit

private final class ClosureSleeve: NSObject {
    private let closure: DefaultBlock

    init(closure: @escaping DefaultBlock) {
        self.closure = closure
        super.init()
    }

    @objc
    func invoke() {
        closure()
    }
}

public extension UIControl {

    func setAction(for event: Event = .touchUpInside, _ action: @escaping DefaultBlock) {
        let sleeve = ClosureSleeve(closure: action)
        addTarget(sleeve, action: #selector(sleeve.invoke), for: event)
        objc_setAssociatedObject(self, UUID().uuidString, sleeve, .OBJC_ASSOCIATION_RETAIN)
    }

}

public extension UIBarButtonItem {

    func setAction(_ action: @escaping DefaultBlock) {
        let sleeve = ClosureSleeve(closure: action)
        target = sleeve
        self.action = #selector(sleeve.invoke)
        objc_setAssociatedObject(self, UUID().uuidString, sleeve, .OBJC_ASSOCIATION_RETAIN)
    }

}
