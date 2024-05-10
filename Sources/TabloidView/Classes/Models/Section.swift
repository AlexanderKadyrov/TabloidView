import DifferenceKit
import Foundation

public struct Section<Element: TabloidCellViewModel>: DifferentiableSection {
    
    public let index: Int
    
    public let elements: [Element]
    public let header: Element?
    public let footer: Element?
    
    @inlinable
    public var differenceIdentifier: Int {
        return index
    }
    
    public init<C: Collection>(index: Int, elements: C, header: Element? = nil, footer: Element? = nil) where C.Element == Element {
        self.index = index
        self.elements = Array(elements)
        self.header = header
        self.footer = footer
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
