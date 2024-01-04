import Foundation

open class TabloidCellViewModel: NSObject {
    
    public let cellIdentifier: String
    
    public init(cellIdentifier: String) {
        self.cellIdentifier = cellIdentifier
        super.init()
    }
}
