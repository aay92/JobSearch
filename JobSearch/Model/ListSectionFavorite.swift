import Foundation

enum ListSectionFavorite {
    case vacancy([ListItem])
    
    var items: [ListItem] {
        switch self {
        case .vacancy(let items):
            return items
        }
    }
    
    var count: Int {
        items.count
    }
    
    var title: String {
        switch self {
        case .vacancy(_):
            return "Вакансии для вас"

        }
    }
}
