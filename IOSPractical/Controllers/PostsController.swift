import UIKit

class PostsController: UIViewController {
    
    @IBOutlet weak var postTableView: UITableView!
    @IBOutlet weak var loader: UIActivityIndicatorView!
    
    private var postResponse : PostsResponse? = nil {
        didSet {
            postTableView.reloadData()
        }
    }
    
    private var isLoading : Bool = false {
        didSet {
            isLoading ? loader.startAnimating() : loader.stopAnimating()
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isLoading = true
        PostsService.getPosts(skip: 0, limit: 20) { postsRes in
            self.postResponse = postsRes
            self.isLoading = false
        } failure: { error in
            print("Error fetching posts \(error)")
            self.isLoading = false
        }
    }

}


extension PostsController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return postResponse?.posts.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PostTableViewCell", for: indexPath) as? PostTableViewCell {
            if let post = postResponse?.posts[indexPath.row] {
                cell.setupPostData(post: post)
            }
            return cell
        }
        
        return UITableViewCell()
    }
    
}
