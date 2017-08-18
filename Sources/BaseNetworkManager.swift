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
    
    public func get<T: BaseModel>(url: String, headers: [String: String]?, parameters: [String: AnyObject]?, completion: @escaping (_ data: T?, _ response: URLResponse?, _ error: Error?) -> Void) {
        
        print("GET request at:", url)
        
        var stayAlive = true
        
        let queue = DispatchQueue(label: "swa_tools", qos: .userInitiated, attributes: .concurrent)
        Alamofire.request(url, method: .get, parameters: parameters)
            .validate()
            .responseString(queue: queue) { response in
                print(response.response?.statusCode)
                // parse the headers and store the cookies
                guard let header = response.response?.allHeaderFields as? [String: String], let url = response.request?.url else {
                    completion(nil, response.response, response.error)
                    return
                }
                let cookies = HTTPCookie.cookies(withResponseHeaderFields: header, for: url)
                self.set(cookies: cookies, for: url)
                
                // parse the content
                guard let responseUrl = response.response?.url else {
                    completion(nil, response.response, response.error)
                    return
                }
                
                guard let responseValue = response.result.value else {
                    completion(nil, response.response, response.error)
                    return
                }
                
                let doc = HTMLDocument(string: responseValue)
                
                let t = T()
                t.loadDataFrom(dictionary: [
                        "url": responseUrl.absoluteString,
                        "contentString": responseValue,
                        "htmlDocument": doc
                    ]
                )
                completion(t, response.response, response.error)
                
                stayAlive = false
            }
        
        let runLoop = RunLoop.current
        let loopEstablished = runLoop.run(mode: .defaultRunLoopMode, before: Date(timeIntervalSinceNow: 0.1))
        while stayAlive && loopEstablished {
                // Run, run, run
        }
    }
}
