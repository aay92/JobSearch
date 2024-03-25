import Foundation
import UIKit

struct MockData {
    static let shared = MockData()
    
    private let recommendations: ListSection = {
        .recommendations([.init(title: "", images: "avatar"),
                .init(title: "", images: "avatar"),
                .init(title: "", images: "avatar")])
    }()
    
    private let vacancy: ListSection = {
        .vacancy([.init(title: "", images: ""),
                   .init(title: "", images: ""),
                   .init(title: "", images: ""),
        ])
    }()
    
    private let vacancyFavorite: ListSectionFavorite = {
        .vacancy([.init(title: "", images: ""),
                   .init(title: "", images: ""),
                   .init(title: "", images: ""),
        ])
    }()
    
    var pageData: [ListSection] {
        [recommendations, 
         vacancy]
    }
    var pageDataFavorite: [ListSectionFavorite] {
        [vacancyFavorite]
    }
}

