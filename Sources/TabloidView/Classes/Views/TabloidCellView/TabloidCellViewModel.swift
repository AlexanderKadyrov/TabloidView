import Foundation
import DifferenceKit

open class TabloidCellViewModel: Differentiable {
    
    public var differenceIdentifier: String {
        return ""
    }
    
    public let cellIdentifier: String
    
    public init(cellIdentifier: String) {
        self.cellIdentifier = cellIdentifier
    }
    
    public func isContentEqual(to source: TabloidCellViewModel) -> Bool {
        return false
    }
}
