import SwiftData
import SwiftUI

public struct WithQuery<Model: PersistentModel, Content: View>: View {
    @Query private var models: [Model]

    private var content: ([Model]) -> Content

    public init(
        descriptor: FetchDescriptor<Model>,
        animation: Animation = .default,
        @ViewBuilder content: @escaping (_ models: [Model]) -> Content
    ) {
        _models = .init(descriptor, animation: animation)
        self.content = content
    }

    public init(
        filter: Predicate<Model>? = nil,
        sort: [SortDescriptor<Model>] = [],
        order: SortOrder = .forward,
        animation: Animation = .default,
        content: @escaping (_ models: [Model]) -> Content
    ) {
        _models = .init(filter: filter, sort: sort, animation: animation)
        self.content = content
    }

    public var body: some View {
        content(models)
    }
}

public struct WithQuery2<Model: PersistentModel, Content: View>: View {
    @Query private var models: [Model]

    private var onChange: (([Model]) -> Void)?
    private var content: () -> Content

    public init(
        descriptor: FetchDescriptor<Model>,
        animation: Animation = .default,
        onChange: (([Model]) -> Void)? = nil,
        @ViewBuilder content: @escaping () -> Content
    ) {
        _models = .init(descriptor, animation: animation)
        self.onChange = onChange
        self.content = content
    }

    public var body: some View {
        content()
            .onChange(of: models, initial: true) { oldValue, newValue in
                onChange?(newValue)
            }
    }
}
