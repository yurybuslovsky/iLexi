// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum Common {
    /// Loading this view controller from a nib is unsupported in favor of initializer dependency injection
    internal static let niblessControllersDescription = L10n.tr("Localizable", "Common.niblessControllersDescription")
    /// Loading this view from a nib is unsupported in favor of initializer dependency injection
    internal static let niblessViewsDescription = L10n.tr("Localizable", "Common.niblessViewsDescription")
    internal enum Alert {
      /// OK
      internal static let confirm = L10n.tr("Localizable", "Common.Alert.confirm")
      /// Attention
      internal static let title = L10n.tr("Localizable", "Common.Alert.title")
    }
  }

  internal enum EntryInfo {
    /// A word
    internal static let textFieldPlaceholder = L10n.tr("Localizable", "EntryInfo.textFieldPlaceholder")
    /// Add New Entry
    internal static let title = L10n.tr("Localizable", "EntryInfo.title")
    internal enum Button {
      /// Cancel
      internal static let cancel = L10n.tr("Localizable", "EntryInfo.Button.cancel")
      /// Save
      internal static let save = L10n.tr("Localizable", "EntryInfo.Button.save")
    }
  }

  internal enum EntryList {
    /// Delete
    internal static let deleteEntry = L10n.tr("Localizable", "EntryList.deleteEntry")
    /// Entries
    internal static let title = L10n.tr("Localizable", "EntryList.title")
  }

  internal enum Models {
    internal enum Entry {
      internal enum Error {
        /// An entry with the typed value already exists
        internal static let alreadyExists = L10n.tr("Localizable", "Models.Entry.Error.alreadyExists")
      }
    }
  }
}
// swiftlint:enable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:enable nesting type_body_length type_name vertical_whitespace_opening_braces

// MARK: - Implementation Details

extension L10n {
  private static func tr(_ table: String, _ key: String, _ args: CVarArg...) -> String {
    let format = BundleToken.bundle.localizedString(forKey: key, value: nil, table: table)
    return String(format: format, locale: Locale.current, arguments: args)
  }
}

// swiftlint:disable convenience_type
private final class BundleToken {
  static let bundle = Bundle(for: BundleToken.self)
}
// swiftlint:enable convenience_type
