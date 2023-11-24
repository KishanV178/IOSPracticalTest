import Foundation
import ObjectMapper

class PostResponse: Mappable {
    
    var id : Int?
    var title : String?
    var body : String?
    var userId : Int?
    var tags : [String] = []
    var reactions : Int?
    
    required init?(map: Map) {
        
    }

     func mapping(map: Map) {
        id <- map["id"]
        title <- map["title"]
        body <- map["body"]
        userId <- map["userId"]
        tags <- map["tags"]
        reactions <- map["reactions"]
    }
}
