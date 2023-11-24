import UIKit

class PostTableViewCell : UITableViewCell {
    
    @IBOutlet var idLabel : UILabel!
    @IBOutlet var titleLabel : UILabel!
    @IBOutlet var bodyLabel : UILabel!
    @IBOutlet var tagsLabel : UILabel!
    @IBOutlet var reactionsLabel : UILabel!
    
    override class func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func setupPostData(post : PostResponse) {
        idLabel.text = "\(post.id ?? 0)"
        titleLabel.text = post.title
        bodyLabel.text = post.body
        tagsLabel.text = post.tags.joined(separator: ", ").uppercased()
        reactionsLabel.text = "\(post.reactions ?? 0)"
    }
}
