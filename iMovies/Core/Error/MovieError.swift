import Foundation

enum MovieError: LocalizedError {
    
    case invalidData
    case unableToLoadData
    case networkError
    case unauthorized
    case custom(message: String)
    case unknown
    
}

extension MovieError {
    var errorDescription: String? {
        switch self {
        case .invalidData:
            return NSLocalizedString("Oops! Something went wrong!", comment: "")
        case .unableToLoadData:
            return NSLocalizedString("Unable to load data", comment: "")
        case .networkError:
            return NSLocalizedString("A network error occured", comment: "")
        case .unauthorized:
            return NSLocalizedString("Unauthorized", comment: "")
        case .custom(let message):
            return NSLocalizedString(message, comment: "")
        case .unknown:
            return NSLocalizedString("Oops! Something went wrong!", comment: "")
        }
    }
    
    var recoverySuggestion: String? {
        switch self {
        case .invalidData:
            return NSLocalizedString("Please try again", comment: "")
        case .unableToLoadData:
            return NSLocalizedString("Please check your internet connection", comment: "")
        case .networkError:
            return NSLocalizedString("Please check your internet connection", comment: "")
        case .unauthorized:
            return NSLocalizedString("Please provide correct email and password", comment: "")
        case .custom(let message):
            return NSLocalizedString(message, comment: "")
        case .unknown:
            return NSLocalizedString("Please try again later", comment: "")
        }
    }
}
