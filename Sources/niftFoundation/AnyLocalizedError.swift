import Foundation

public struct AnyLocalizedError: LocalizedError {
    public var error: Error

    public var errorDescription: String? {
        error.localizedDescription
    }

    public var failureReason: String? {
        (error as? LocalizedError)?.failureReason
    }

    public var recoverySuggestion: String? {
        (error as? LocalizedError)?.recoverySuggestion
    }

    public var helpAnchor: String? {
        (error as? LocalizedError)?.helpAnchor
    }
}

public extension Error {
    var localized: AnyLocalizedError {
        .init(error: self)
    }
}
