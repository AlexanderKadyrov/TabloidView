import Foundation

open class TabloidCellViewModel: NSObject {
    
    // MARK: - Properties
    
    public let cellIdentifier: String
    
    // MARK: - Initialization
    
    public init(cellIdentifier: String) {
        self.cellIdentifier = cellIdentifier
        super.init()
    }
}
