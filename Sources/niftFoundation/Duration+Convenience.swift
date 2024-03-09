extension Duration {
    /// Construct a `Duration` given a number of minutes represented as a
    /// `BinaryInteger`.
    ///
    ///       let d: Duration = .minutes(77)
    ///
    /// - Returns: A `Duration` representing a given number of minutes.
    @available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
    public static func minutes<T>(_ minutes: T) -> Duration where T : BinaryInteger {
        .seconds(minutes * 60)
    }

    /// Construct a `Duration` given a number of minutes represented as a
    /// `Double` by converting the value into the closest attosecond scale value.
    ///
    ///       let d: Duration = .minutes(12.38)
    ///
    /// - Returns: A `Duration` representing a given number of minutes.
    @available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
    public static func minutes(_ minutes: Double) -> Duration {
        .seconds(minutes * 60)
    }

    /// Construct a `Duration` given a number of hours represented as a
    /// `BinaryInteger`.
    ///
    ///       let d: Duration = .hours(3)
    ///
    /// - Returns: A `Duration` representing a given number of hours.
    @available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
    public static func hours<T>(_ hours: T) -> Duration where T : BinaryInteger {
        .seconds(hours * 3600)
    }

    /// Construct a `Duration` given a number of hours represented as a
    /// `Double` by converting the value into the closest attosecond scale value.
    ///
    ///       let d: Duration = .hours(3.57)
    ///
    /// - Returns: A `Duration` representing a given number of hours.
    @available(macOS 13.0, iOS 16.0, watchOS 9.0, tvOS 16.0, *)
    public static func hours(_ hours: Double) -> Duration {
        .seconds(hours * 3600)
    }
}
