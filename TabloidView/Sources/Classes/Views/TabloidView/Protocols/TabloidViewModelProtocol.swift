import ReactiveSwift
import Foundation

public protocol TabloidViewModelProtocol {
    
    // MARK: - Properties
    
    var pipeDidSelectItem: (output: Signal<TabloidCellViewModelProtocol, Never>, input: Signal<TabloidCellViewModelProtocol, Never>.Observer) { get }
    var elements: MutableProperty<[[TabloidCellViewModelProtocol]]> { get }
    
    var cellIdentifiers: [String] { get }
    
    // MARK: - Initialization
    
    init(cellIdentifiers: [String])
}
