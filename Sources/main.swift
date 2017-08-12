import Foundation

// establish the persistent connect; i.e. cookies
NetworkManager.sharedInstance.establishConnection()

// submit the search for the flight
let body = [
    "originCode": "DEN",
    "destinationCode": "MSY",
    "returnCode": "DEN",
    "outboundDate": "08/12/2017",
    "inboundDate": "08/14/2017",
    "tripType": "false",
    "travelOnAirTran": "false",
    "noModalFor": "null",
    "lowfareSearch": "undefined"
]
let parameters = [
    "displayOnly": "",
    "int": "HOMEQBOMAIR"
]


NetworkManager.sharedInstance.get(endpoint: "/flight/select-flight.html", parameters: parameters as [String : AnyObject], body: body) { (data, resposne, error) in
    guard let html = data else {
        return
    }
}
