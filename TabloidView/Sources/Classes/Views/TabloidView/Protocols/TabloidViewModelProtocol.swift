import ReactiveSwift
import Foundation

public protocol TabloidViewModelProtocol {
    
    // MARK: - Properties
    
    var pipeDidSelectItem: Signal<TabloidCellViewModelProtocol, Never> { get }
    var elements: MutableProperty<[[TabloidCellViewModelProtocol]]> { get }
    
    var cellIdentifiers: [String] { get }
    
    // MARK: - Initialization
    
    init(cellIdentifiers: [String])
}
