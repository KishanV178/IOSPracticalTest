import Foundation
import Moya

enum PostTarget:BaseAPITarget {
    case getPosts(skip:Int, limit:Int)
}

extension PostTarget {
    
    static var baseProvider: BaseProvider<PostTarget> {
        return BaseProvider(isLogger: true)
    }
    
    static var isAuthorization: Bool { true }
    
    static var isAccountID: Bool { true }
    
    var baseURL: URL {
        return baseAPIURL.appendingPathComponent(PostsApiConsts.posts)
    }
    
    var path: String {
        switch self {
        case .getPosts:
           return PostsApiConsts.Endpoint.getPosts
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .getPosts:
            return .get
        }
    }
    
    var sampleData: Data {
        return Data()
    }
    
    var task: Task { .requestPlain }
     
}
