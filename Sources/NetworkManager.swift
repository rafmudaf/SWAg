import Foundation

class NetworkManager: BaseNetworkManager {
    
    let baseURL = "https://www.southwest.com/"
    
    let headers = [
        "Accept": "text/html,application/xhtml+xml,application/xml;q=0.9,image/webp,image/apng,*/*;q=0.8",
        "Accept-Encoding": "gzip, deflate, br",
        "Accept-Language": "en-US,en;q=0.8",
        "Cache-Control": "max-age=0",
        "Connection": "keep-alive",
        "Host": "www.southwest.com",
        "Upgrade-Insecure-Requests": "1",
        "User-Agent": "Mozilla/5.0 (Macintosh; Intel Mac OS X 10_12_6) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/60.0.3112.90 Safari/537.36",
        "Content-Type": "application/json; charset=utf-8"
    ]
        
    override init () {
        // TODO
    }
    
    static let sharedInstance = NetworkManager()
    
    func establishConnection(completion: @escaping (_ data: [CookieModel]?, _ response: URLResponse?, _ error: Error?) -> Void) {
        let url = baseURL+"flight"
        get(url: url, headers: headers, parameters: nil)  { (data, response, error) in
            completion(nil, response, error)
        }
    }
    
    func get(endpoint: String, parameters: [String: String]?, body: [String: String]?, completion: @escaping (_ data: HtmlModel?, _ response: URLResponse?, _ error: Error?) -> Void) {
        let url = baseURL+endpoint
        get(url: url, headers: headers, parameters: parameters as [String: AnyObject]?, completion: completion)
    }
}
