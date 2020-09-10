// swiftlint:disable all
// Generated using SwiftGen — https://github.com/SwiftGen/SwiftGen

import Foundation

// swiftlint:disable superfluous_disable_command file_length implicit_return

// MARK: - Strings

// swiftlint:disable explicit_type_interface function_parameter_count identifier_name line_length
// swiftlint:disable nesting type_body_length type_name vertical_whitespace_opening_braces
internal enum L10n {

  internal enum NavBarTitle {
    /// Favorites
    internal static let favorites = L10n.tr("Localizable", "NavBarTitle.favorites")
    /// Log In
    internal static let logIn = L10n.tr("Localizable", "NavBarTitle.logIn")
    /// New Word
    internal static let newWord = L10n.tr("Localizable", "NavBarTitle.newWord")
    /// Profile
    internal static let userProfile = L10n.tr("Localizable", "NavBarTitle.userProfile")
    /// Words
    internal static let wordList = L10n.tr("Localizable", "NavBarTitle.wordList")
  }

  internal enum TabBarItem {
    /// Profile
    internal static let userProfile = L10n.tr("Localizable", "TabBarItem.userProfile")
    /// Words
    internal static let wordList = L10n.tr("Localizable", "TabBarItem.wordList")
  }

  internal enum XcodeMessage {
    /// Loading this view controller from a nib is unsupported in favor of initializer dependency injection
    internal static let niblessControllersDescription = L10n.tr("Localizable", "XcodeMessage.niblessControllersDescription")
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
