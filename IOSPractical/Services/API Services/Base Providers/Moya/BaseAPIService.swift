
import Foundation
import Moya

protocol BaseAPITarget : TargetType {
    
}

extension BaseAPITarget {
    
    var baseAPIURL: URL {
        guard let url = URL(string: APIConsts.baseApiUrl) else { fatalError("Config not intitialized yet") }
        return url
    }
    
    var headers: [String : String]? {
        let defaultHeaders = [
            "Content-Type":"application/json",
            "Accept":"*/*"
        ]
        return defaultHeaders
    }
}
