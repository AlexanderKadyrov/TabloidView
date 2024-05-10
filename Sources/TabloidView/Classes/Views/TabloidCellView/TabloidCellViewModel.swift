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
    public let identifier: String
    public let size: CGSize?
    
    public init(identifier: String, size: CGSize? = nil) {
        self.identifier = identifier
        self.size = size
    }
    
    public func add(delegate: TabloidCellViewModelDelegate) {
        multicastDelegate.add(delegate)
    }
    
    func set(selected: Bool, viewModel: TabloidCellViewModel) {
        self.selected = selected
        multicastDelegate.invoke { $0.set(selected: selected, viewModel: viewModel) }
    }
    
    open func isContentEqual(to source: TabloidCellViewModel) -> Bool {
        return false
    }
}
