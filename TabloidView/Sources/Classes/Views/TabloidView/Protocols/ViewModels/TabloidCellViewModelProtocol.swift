import Foundation

public enum TabloidCellViewHeight {
    case automaticDimension
    case some(Float)
}

public protocol TabloidCellViewModelProtocol {
    
    // MARK: - Properties
    
    var cellIdentifier: String { get }
    
    // MARK: - Initialization
    
    init(cellIdentifier: String)
    
    // MARK: - Height
    
    func height() -> TabloidCellViewHeight
}
