import Foundation
import RxSwift

protocol BasePostsDataSource {
    func getPosts(skip:Int, limit:Int) -> Observable<PostsResponse>
}
