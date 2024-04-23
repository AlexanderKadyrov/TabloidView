import Foundation

extension Bundle {
    var name: String? {
        return (Bundle.main.infoDictionary?["CFBundleName"] as? String)?.replacingOccurrences(of: ".", with: "_")
    }
}
