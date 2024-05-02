import Foundation
import DifferenceKit

public protocol TabloidCellViewModelDelegate: AnyObject {
    func set(selected: Bool, viewModel: TabloidCellViewModel)
}

open class TabloidCellViewModel: Differentiable {
    
    private let multicastDelegate = MulticastDelegate<TabloidCellViewModelDelegate>()
    
    open var differenceIdentifier: String {
        return ""
    }
    
    public private(set) var selected = false
    public let cellIdentifier: String
    
    public init(cellIdentifier: String) {
        self.cellIdentifier = cellIdentifier
    }
    
    open func set(selected: Bool, viewModel: TabloidCellViewModel) {
        self.selected = selected
        multicastDelegate.invoke { $0.set(selected: selected, viewModel: viewModel) }
    }
    
    open func isContentEqual(to source: TabloidCellViewModel) -> Bool {
        return false
    }
}
