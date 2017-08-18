import Foundation
import HTMLReader

class HtmlModel: BaseModel {
    
    private var url: URL?
    private var contentString: String?
    private var htmldoc: HTMLDocument?
    
    override func loadDataFrom(dictionary: NSDictionary) {
        
        dictionaryRepresentation = dictionary
        
        url = nil
        if let urlString = dictionary.object(forKey: "url") as? String {
            url = URL(string: urlString)
        }
        
        contentString = dictionary.object(forKey: "contentString") as? String ?? nil
        
        htmldoc = dictionary.object(forKey: "htmlDocument") as? HTMLDocument ?? nil
    }
    
    public func getUrlString() -> String? {
        return url?.absoluteString
    }
    
    public func getContentString() -> String? {
        return contentString
    }
    
    public func getHtmlDoc() -> HTMLDocument? {
        return htmldoc
    }
}
