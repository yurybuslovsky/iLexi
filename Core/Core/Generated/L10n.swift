// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
public enum L10n {

  public enum Actions {
    public enum EntryInfo {
      public enum Error {
        /// An entry with the typed value already exists
        public static let alreadyExists = L10n.tr("Localizable", "Actions.EntryInfo.Error.alreadyExists")
      }
    }
  }

  public enum Common {
    public enum Alert {
      /// OK
      public static let confirm = L10n.tr("Localizable", "Common.Alert.confirm")
      /// Attention
      public static let title = L10n.tr("Localizable", "Common.Alert.title")
    }
  }

  public enum EntryInfo {
    /// A word
    public static let textFieldPlaceholder = L10n.tr("Localizable", "EntryInfo.textFieldPlaceholder")
    /// Add New Entry
    public static let title = L10n.tr("Localizable", "EntryInfo.title")
    public enum Button {
      /// Cancel
      public static let cancel = L10n.tr("Localizable", "EntryInfo.Button.cancel")
      /// Save
      public static let save = L10n.tr("Localizable", "EntryInfo.Button.save")
    }
  }

  public enum EntryList {
    /// Delete
    public static let deleteEntry = L10n.tr("Localizable", "EntryList.deleteEntry")
    /// Entries
    public static let title = L10n.tr("Localizable", "EntryList.title")
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
