import SwiftUI

public extension Binding {
    static func boolify<T>(_ binding: Binding<T?>) -> Binding<Bool> {
        .init {
            binding.wrappedValue != nil
        } set: {
            if !$0 {
                binding.wrappedValue = nil
            }
        }
    }
}
