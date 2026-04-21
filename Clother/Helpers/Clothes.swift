import SwiftData
import SwiftUI


@Model
class Clothes: Identifiable{
    var id = UUID()
    var title:String
    
    init(id: UUID = UUID(),
         title: String) {
        
        self.id = id
        self.title = title
    }
}

var sunny_top: [Clothes] = [
    Clothes(title: "tee"),
    Clothes(title: "polo_shirt"),
    Clothes(title: "men_tee")
    
    ]

