import Foundation

public protocol TabloidCellViewModelProtocol {
    
    // MARK: - Properties
    
    var cellIdentifier: String { get }
    var height: Float? { get }
    
    // MARK: - Initialization
    
    init(cellIdentifier: String)
}
