import Foundation

func searchForFlight() {
    // submit the search for the flight
    let parameters = [
        "displayOnly": "",
        "int": "HOMEQBOMAIR"
    ]
    let body = [
        "originCode": "DEN",
        "destinationCode": "MSY",
        "returnCode": "DEN",
        "outboundDate": "09/01/2017",
        "inboundDate": "09/04/2017",
        "tripType": "false",
        "travelOnAirTran": "false",
        "noModalFor": "null",
        "lowfareSearch": "undefined"
    ]
    NetworkManager.sharedInstance.get(endpoint: "flight/select-flight.html", parameters: parameters, body: body) { (data, response, error) in
        guard let html = data else {
            return
        }
        
//        if let doc = html.getHtmlDoc() {
//            print(doc.bodyElement?.children as Any)
//        }
        
        
//        print(html.getContentString())
    }
}

searchForFlight()
