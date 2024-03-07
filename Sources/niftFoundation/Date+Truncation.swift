import Foundation

public extension Date {
    func startOf(unit: CalendarUnit, calendar: Calendar? = nil) -> Date {
        let calendar = calendar ?? Calendar.current
        let mask: Set<Calendar.Component> = switch unit {
        case .era:
            [.timeZone, .era]
        case .year:
            [.timeZone, .era, .year]
        case .month:
            [.timeZone, .era, .year, .month]
        case .week:
            [.timeZone, .era, .yearForWeekOfYear, .weekOfYear]
        case .day:
            [.timeZone, .era, .year, .month, .day]
        case .hour:
            [.timeZone, .era, .year, .month, .day, .hour]
        case .minute:
            [.timeZone, .era, .year, .month, .day, .hour, .minute]
        case .second:
            [.timeZone, .era, .year, .month, .day, .hour, .minute, .second]
        }

        let dateComponents = calendar.dateComponents(mask, from: self)

        guard let result = calendar.date(from: dateComponents) else {
            fatalError("Failed to get from DateComponents \(dateComponents)")
        }

        return result
    }

    func endOf(unit: CalendarUnit, calendar: Calendar? = nil) -> Date {
        startOf(unit: unit, calendar: calendar)
            .adding(1, unit: unit, calendar: calendar)
    }
}
