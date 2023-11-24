import Foundation
import Moya
import RxSwift

class PostsDataSource: BasePostsDataSource {
    static var shared = PostsDataSource()
    static var provider: BaseProvider<PostTarget> = PostTarget.baseProvider
    func getPosts(skip: Int, limit: Int) -> RxSwift.Observable<PostsResponse> {
        return Self.provider
            .rx.request(.getPosts(skip: skip, limit: limit))
            .mapSuccess(PostsResponse.self)
            .asObservable()
    }

}
