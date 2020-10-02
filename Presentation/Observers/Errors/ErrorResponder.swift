//
//  ErrorResponder.swift
//  Observers
//
//  Created by Yury Buslovsky on 02.10.2020.
//

import Core
import UIKit

public protocol ErrorResponder: class {
    func respondTo(error: LocalizedError)
}

public extension ErrorResponder where Self: UIViewController {

    func respondTo(error: LocalizedError) {
        let alert = UIAlertController(
            title: L10n.Common.Alert.title,
            message: error.localizedDescription,
            preferredStyle: .alert
        )

        let confirmAction = UIAlertAction(title: L10n.Common.Alert.confirm, style: .default) { _ in
            alert.dismiss(animated: true)
        }

        alert.addAction(confirmAction)
        present(alert, animated: true)
    }

}
