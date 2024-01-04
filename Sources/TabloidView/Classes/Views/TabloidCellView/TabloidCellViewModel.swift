import Foundation
import Combine

open class TabloidCellViewModel {
    
    public let didSelect = PassthroughSubject<TabloidCellViewModel, Never>()
    public let cellIdentifier: String
    
    public init(cellIdentifier: String) {
        self.cellIdentifier = cellIdentifier
    }
}
