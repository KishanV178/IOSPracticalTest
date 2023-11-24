import ObjectMapper
import RxSwift

class PostsService: NSObject {

    static private var datasource: BasePostsDataSource {
        get {
            return PostsDataSource()
        }
    }

    static var compositeDisposable: CompositeDisposable = CompositeDisposable()

    class func getPosts(skip: Int, limit: Int) -> Observable<PostsResponse> {
        return datasource.getPosts(skip: skip, limit: limit)
    }

    class func getPosts(skip: Int, limit: Int, success: ((PostsResponse) -> ())?, failure: ((Any) -> ())?) {
        let dispose = getPosts(skip: skip, limit: limit)
            .subscribe(onNext: { postRes in
            success?(postRes)
        }, onError: { error in
                if let error = error as? AppError, let error = error.errorData {
                    failure?(error)
                }
            }, onCompleted: nil, onDisposed: nil)
        _ = compositeDisposable.insert(dispose)
    }

    class func dispose() {
        compositeDisposable.dispose()
    }
}
