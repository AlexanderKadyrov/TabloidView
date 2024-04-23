import DifferenceKit
import Foundation

public struct Section<Element: TabloidCellViewModel>: DifferentiableSection {
    
    public var index: Int
    public var elements: [Element]
    
    @inlinable
    public var differenceIdentifier: Int {
        return index
    }
    
    public init<C: Collection>(index: Int, elements: C) where C.Element == Element {
        self.index = index
        self.elements = Array(elements)
    }
    
    @inlinable
    public init<C: Collection>(source: Section, elements: C) where C.Element == Element {
        self.init(index: source.index, elements: elements)
    }
    
    @inlinable
    public func isContentEqual(to source: Section) -> Bool {
        return source.index == index
    }
}
