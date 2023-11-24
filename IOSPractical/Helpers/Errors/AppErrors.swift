
import Foundation
import Moya
import ObjectMapper

class AppError: NSObject,Error {
    var message: String
    var errorData : Any?
    
    init(message: String, errorData: Any? = nil) {
        self.message = message
        self.errorData = errorData
    }
    
    var localizedDescription: String {
        return message
    }
}
