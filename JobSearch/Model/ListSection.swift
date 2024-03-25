import Foundation

enum ListSection {
    case recommendations([ListItem])
    case vacancy([ListItem])
    
    var items: [ListItem] {
        switch self {
        case    .recommendations(let items),
                .vacancy(let items):
            return items
        }
    }
    
    var count: Int {
        items.count
    }
    
    var title: String {
        switch self {
            
        case .recommendations(_):
            return ""
        case .vacancy(_):
            return "Вакансии для вас"

        }
    }
}
