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

open class TabloidViewModel: TabloidViewModelProtocol {
    
    // MARK: - Properties
    
    public let pipeDidSelectItem = Signal<TabloidCellViewModelProtocol, Never>.pipe()
    public let elements = MutableProperty<[[TabloidCellViewModelProtocol]]>([])
    
    public let cellIdentifiers: [String]
    
    // MARK: - Initialization
    
    public required init(cellIdentifiers: [String]) {
        self.cellIdentifiers = cellIdentifiers
    }
}
