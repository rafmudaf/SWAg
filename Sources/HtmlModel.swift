import Foundation

class HtmlModel: BaseModel {
    
    // private var status: String?
    // private var url: URL?
    // private var title: String?
    // private var link: URL?
    // private var author: String?
    // private var description: String?
    // private var image: String?
    // private var articles = [NewsArticleModel]()
    
    override func loadDataFrom(dictionary: NSDictionary) {
        
        dictionaryRepresentation = dictionary
        
        // status = dictionary.object(forKey: "status") as? String ?? nil
        // 
        // if let feed = dictionary.object(forKey: "source") as? NSDictionary {
        //     
        //     if let urlString = feed.object(forKey: "url") as? String {
        //         url = URL(string: urlString)
        //     } else {
        //         url = nil
        //     }
        //     
        //     title = feed.object(forKey: "title") as? String ?? nil
        //     
        //     if let urlString = feed.object(forKey: "link") as? String {
        //         link = URL(string: urlString)
        //     } else {
        //         link = nil
        //     }
        //     
        //     author = feed.object(forKey: "author") as? String ?? nil
        //     description = feed.object(forKey: "description") as? String ?? nil
        //     image = feed.object(forKey: "image") as? String ?? nil
        // }
        // 
        // for article in dictionary.object(forKey: "items") as! NSArray {
        //     let art = NewsArticleModel(dictionary: article as! NSDictionary)
        //     articles.append(art)
        // }
    }
    
    // public func getArticleCount() -> Int {
    //     return articles.count
    // }
    // 
    // public func getArticles() -> [NewsArticleModel] {
    //     return articles
    // }
}