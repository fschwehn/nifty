import Foundation

public extension Date {
    func adding(_ value: Int, unit: CalendarUnit, calendar: Calendar? = nil) -> Date {
        let calendar = calendar ?? Calendar.current
        return calendar.date(byAdding: unit.component, value: value, to: self)!
    }
    
    mutating func add(_ value: Int, unit: CalendarUnit, calendar: Calendar? = nil) {
        self = adding(value, unit: unit, calendar: calendar)
    }
}
