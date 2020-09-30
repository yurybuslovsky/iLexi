//
//  ErrorResponder.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 25.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import Core
import UIKit

protocol ErrorResponder: class {
    func respondTo(error: LocalizedError)
}

extension ErrorResponder where Self: UIViewController {

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
