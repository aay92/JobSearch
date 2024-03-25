import UIKit

struct AppFont {
    static func regular(ofSize size: CGFloat) -> UIFont {
        return UIFont(name: "SF Pro Display", size: size) ?? .systemFont(ofSize: size)
    }
}
