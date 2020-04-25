import ReactiveSwift
import Foundation

open class TabloidViewModel: TabloidViewModelProtocol {
    
    // MARK: - Properties
    
    public let pipeDidSelectItem = Signal<TabloidCellViewModelProtocol, Never>.pipe()
    public let elements = MutableProperty<[[TabloidCellViewModelProtocol]]>([])
    
    public let cellIdentifiers: [String]
    
    // MARK: - Initialization
    
    public required init(cellIdentifiers: [String]) {
        self.cellIdentifiers = cellIdentifiers
    }
}
