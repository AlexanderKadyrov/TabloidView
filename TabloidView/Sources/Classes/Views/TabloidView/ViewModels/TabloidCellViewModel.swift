import Foundation

open class TabloidCellViewModel {
    
    // MARK: - Properties
    
    public let cellIdentifier: String
    
    // MARK: - Initialization
    
    public required init(cellIdentifier: String) {
        self.cellIdentifier = cellIdentifier
    }
}
