import Foundation
import ObjectMapper

class PostsResponse: Mappable {
    var total : Int?
    var skip : Int?
    var limit : Int?
    var posts: [PostResponse] = []

    public required init?(map: Map) {
        
    }

    public func mapping(map: Map) {
        total <- map["total"]
        skip <- map["skip"]
        limit <- map["limit"]
        posts <- map["posts"]
    }
    
}
