import RxSwift
import ObjectMapper
import SwiftyJSON
import Moya
import Alamofire

extension PrimitiveSequenceType where Trait == SingleTrait, Element == Response{
    
    func mapSuccess<T: Mappable>(_ type : T.Type) -> Single<T> {
        map { element in
            if let data = try? AppUtils.decode(type, response: element) {
                return data
            } else {
                throw AppError(message:"Error mapping data to \(type)",errorData: element)
            }
        }
    }
    
    func mapError<T: Mappable>(_ type : T.Type) -> Single<Element> {
        map { element in
            if let data = try? AppUtils.decode(type, response: element) {
                throw AppError(message:"API error mapped", errorData: data)
            } else {
                throw AppError(message: "Error mapping error to \(type)", errorData: element.statusCode)
            }
        }
    }
    
}
