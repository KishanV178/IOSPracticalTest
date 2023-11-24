import ObjectMapper
import SwiftyJSON
import Moya

class AppUtils {
    static func decode<T:Mappable>(_ type: T.Type, response: Response) throws -> T {
        do {
            let dictionaryObject = try JSON(data: response.data).dictionaryObject
            if let dict = dictionaryObject {
                let data = T(JSON: dict)
                if let data = data {
                    return data
                } else {
                    throw AppError(message: "Not able to map data to type", errorData: response)
                }
            } else {
                throw AppError(message: "Not able to map data to type", errorData: response)
            }
        } catch let e {
            throw e
        }
    }
}
