import Foundation
import DifferenceKit

public protocol TabloidCellViewModelDelegate: AnyObject {
    func didSelect(cellViewModel: TabloidCellViewModel)
}

open class TabloidCellViewModel: Differentiable {
    
    open var differenceIdentifier: String {
        return ""
    }
    
    public weak var delegate: TabloidCellViewModelDelegate?
    public let cellIdentifier: String
    
    public init(cellIdentifier: String) {
        self.cellIdentifier = cellIdentifier
    }
    
    open func didSelect(cellViewModel: TabloidCellViewModel) {
        delegate?.didSelect(cellViewModel: cellViewModel)
    }
    
    open func isContentEqual(to source: TabloidCellViewModel) -> Bool {
        return false
    }
}
