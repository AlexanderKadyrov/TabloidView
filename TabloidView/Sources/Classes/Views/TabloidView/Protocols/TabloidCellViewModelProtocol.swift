import Foundation

public protocol TabloidCellViewModelProtocol {
    
    // MARK: - Properties
    
    var cellIdentifier: String { get }
    
    // MARK: - Initialization
    
    init(cellIdentifier: String)
}
