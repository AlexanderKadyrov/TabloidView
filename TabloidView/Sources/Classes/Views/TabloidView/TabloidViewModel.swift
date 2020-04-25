import ReactiveSwift
import Foundation

open class TabloidViewModel: TabloidViewModelProtocol {
    
    // MARK: - Properties
    
    public let pipeDidSelectItem = Signal<TabloidCellViewModel, Never>.pipe()
    public let elements = MutableProperty<[[TabloidCellViewModel]]>([])
    
    public let cellIdentifiers: [String]
    
    // MARK: - Initialization
    
    public required init(cellIdentifiers: [String]) {
        self.cellIdentifiers = cellIdentifiers
    }
}
