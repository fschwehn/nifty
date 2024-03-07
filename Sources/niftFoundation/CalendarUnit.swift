import Foundation

public enum CalendarUnit {
    case era
    case year
    case month
    case week
    case day
    case hour
    case minute
    case second
}

public extension CalendarUnit {
    var component: Calendar.Component {
        switch self {
        case .era: .era
        case .year: .year
        case .month: .month
        case .week: .weekOfYear
        case .day: .day
        case .hour: .hour
        case .minute: .minute
        case .second: .second
        }
    }
}
