import Foundation

class BaseModel {

    var dictionaryRepresentation: NSDictionary = [:]
    
    required init() {
        // Include this required init so that generics can initialize from BaseModel
    }
    
    convenience init(dictionary: NSDictionary) {
        self.init()
        loadDataFrom(dictionary: dictionary)
    }

    func loadDataFrom(dictionary: NSDictionary) {
        
        // TODO: validate data
        
        dictionaryRepresentation = dictionary
    }
    
    func dictObjectIsValid(element: AnyObject?) -> Bool {
        if element is NSNull {
            return false
        }
        return element != nil ? true : false
    }
}
