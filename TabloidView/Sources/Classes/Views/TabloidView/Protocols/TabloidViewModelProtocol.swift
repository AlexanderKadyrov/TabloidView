import Foundation

public protocol TabloidViewModelProtocol {
    
    // MARK: - Properties
    
    var cellIdentifiers: [String] { get }
    
    // MARK: - Initialization
    
    init(cellIdentifiers: [String])
}
