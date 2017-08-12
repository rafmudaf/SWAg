import Foundation
import Alamofire
import HTMLReader


class BaseNetworkManager {
  
    init () {
      // TODO initialization
    }
    
    func getHtml<T: BaseModel>(url: String, headers: [String: String]?, parameters: [String: AnyObject]?, completion: @escaping (_ data: T?, _ response: URLResponse?, _ error: Error?) -> Void) {
        
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
                
                let doc = HTMLDocument(string: htmlAsString)
                
                print(htmlAsString)
                
                
                stayAlive = false
            }
        
        let runLoop = RunLoop.current
        while stayAlive && runLoop.run(mode: RunLoopMode.defaultRunLoopMode, before: Date(timeIntervalSinceNow: 0.1)) {
                // Run, run, run
        }
    }
}
