import DifferenceKit
import Foundation

public struct Section<Model: Differentiable, Element: Differentiable>: DifferentiableSection {
    
    public var model: Model
    public var elements: [Element]
    
    @inlinable
    public var differenceIdentifier: Model.DifferenceIdentifier {
        return model.differenceIdentifier
    }
    
    public init<C: Collection>(model: Model, elements: C) where C.Element == Element {
        self.model = model
        self.elements = Array(elements)
    }
    
    @inlinable
    public init<C: Collection>(source: Section, elements: C) where C.Element == Element {
        self.init(model: source.model, elements: elements)
    }
    
    @inlinable
    public func isContentEqual(to source: Section) -> Bool {
        return model.isContentEqual(to: source.model)
    }
}
