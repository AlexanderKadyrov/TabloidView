import ReactiveSwift
import Foundation

public protocol TabloidViewModelProtocol {
    
    // MARK: - Properties
    
    var cellIdentifiers: [String] { get }
    
    // MARK: - Initialization
    
    init(cellIdentifiers: [String])
}

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
