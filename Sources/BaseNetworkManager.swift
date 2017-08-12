import Foundation
import Alamofire
import HTMLReader

class BaseNetworkManager {
  
    init () {
      // TODO initialization
    }
    
    private func set(cookies: [HTTPCookie], for url: URL) {
        Alamofire.SessionManager.default.session.configuration.httpCookieStorage?.setCookies(cookies, for: url, mainDocumentURL: nil)
        
    }
    
    public func get(cookies host: URL) -> [HTTPCookie]? {
        return Alamofire.SessionManager.default.session.configuration.httpCookieStorage?.cookies
    }
    
    public func establishConnection(url: String, headers: [String: String]?, parameters: [String: AnyObject]?, completion: @escaping (_ data: [HTTPCookie]?, _ response: URLResponse?, _ error: Error?) -> Void) {
        
        print(url)
        
        var stayAlive = true
        
        Alamofire.request(url, method: .get, parameters: parameters)
            .validate { request, response, data in
                return .success
            }
            .response { response in
                guard let header = response.response?.allHeaderFields as? [String: String], let url = response.request?.url else {
                    completion(nil, response.response, response.error)
                    return
                }
                
                let cookies = HTTPCookie.cookies(withResponseHeaderFields: header, for: url)
                self.set(cookies: cookies, for: url)
                completion(cookies, response.response, response.error)
                stayAlive = false
        }
        
        let runLoop = RunLoop.current
        while stayAlive && runLoop.run(mode: RunLoopMode.defaultRunLoopMode, before: Date(timeIntervalSinceNow: 0.1)) {
            // Run, run, run
        }
    }
    
    public func getHtml<T: BaseModel>(url: String, headers: [String: String]?, parameters: [String: AnyObject]?, completion: @escaping (_ data: T?, _ response: URLResponse?, _ error: Error?) -> Void) {
        
        print(url)
        
        var stayAlive = true
                        
        Alamofire.request(url, method: .get, parameters: parameters)
            .validate { request, response, data in
                // Custom evaluation closure now includes data (allows you to parse data to dig out error messages if necessary)
                return .success
            }
            .responseString { response in
                guard response.result.error == nil else {
                    completion(nil, response.response, response.result.error)
                    return
                }
                
                guard let htmlAsString = response.result.value else {
                    completion(nil, response.response, response.result.error)
                    return
                }
                
//                print(htmlAsString)
                let doc = HTMLDocument(string: htmlAsString)
                let e = doc.bodyElement?.treeEnumerator()
//                for ee in e! {
//                    print(ee)
//                }
//                print(doc.bodyElement?.treeEnumerator())
//                print(doc.children)
//                print(doc.nodes(matchingSelector: "tr"))
                
                stayAlive = false
            }
        
        let runLoop = RunLoop.current
        while stayAlive && runLoop.run(mode: RunLoopMode.defaultRunLoopMode, before: Date(timeIntervalSinceNow: 0.1)) {
                // Run, run, run
        }
    }
}
