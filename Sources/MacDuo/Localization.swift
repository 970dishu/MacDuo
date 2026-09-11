import Foundation

/// Use the SwiftPM resource bundle for both SwiftUI and AppKit strings.
/// Missing translations fall back to the English source key.
enum L10n {
    private static let bundle: Bundle = {
        if let url = Bundle.main.url(forResource:"MacDuo_MacDuo",withExtension:"bundle"),
           let packaged = Bundle(url:url) { return packaged }
        return Bundle.module
    }()

    static func text(_ key: String) -> String {
        bundle.localizedString(forKey:key,value:key,table:nil)
    }

    static func format(_ key: String, _ arguments: CVarArg...) -> String {
        String(format:text(key),locale:Locale.current,arguments:arguments)
    }
}
