//
//  EntryError.swift
//  iLexi_iOS
//
//  Created by Yury Buslovsky on 20.09.2020.
//  Copyright © 2020 Napoleon IT. All rights reserved.
//

import Foundation

extension Entities.Entry {

    enum Error: LocalizedError {
        typealias Description = L10n.Common.Entry.Error

        case alreadyExists

        var errorDescription: String? {
            switch self {
            case .alreadyExists:
                return Description.alreadyExists
            }
        }
    }

}
