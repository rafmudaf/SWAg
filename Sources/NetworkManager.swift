import Foundation

class NetworkManager: BaseNetworkManager {
    
    let baseURL = "https://www.southwest.com/"
    
    override init () { }
    
    static let sharedInstance = NetworkManager()
    
    func getFlightSelectFlight(headers: [String: String]?, parameters: [String: AnyObject]?, completion: @escaping (_ data: HtmlModel?, _ response: URLResponse?, _ error: Error?) -> Void) {
      let url = baseURL+"flight/select-flight.html"
      getHtml(url: url, headers: headers, parameters: parameters, completion: completion)
    }
}