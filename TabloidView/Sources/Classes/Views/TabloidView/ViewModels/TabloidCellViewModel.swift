import Foundation

public protocol TabloidCellViewModelProtocol {
    
    // MARK: - Properties
    
    var cellIdentifier: String { get }
    
    // MARK: - Initialization
    
    init(cellIdentifier: String)
}

open class TabloidCellViewModel: TabloidCellViewModelProtocol {
    
    // MARK: - Properties
    
    public let cellIdentifier: String
    
    // MARK: - Initialization
    
    public required init(cellIdentifier: String) {
        self.cellIdentifier = cellIdentifier
    }
}
