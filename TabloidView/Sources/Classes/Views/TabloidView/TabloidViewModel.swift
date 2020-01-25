import ReactiveSwift
import Foundation

open class TabloidViewModel {
    
    // MARK: - Enums
    
    public enum SeparatorStyle {
        case singleLine
        case none
    }
    
    public enum TabloidStyle {
        case grouped
        case plain
    }
    
    // MARK: - Properties
    
    public let pipeDidSelectItem = Signal<TabloidCellViewModel, Never>.pipe()
    public let elements = MutableProperty<[[TabloidCellViewModel]]>([])
    
    public let separatorStyle: SeparatorStyle
    public let tabloidStyle: TabloidStyle
    public let cellIdentifiers: [String]
    
    // MARK: - Initialization
    
    public init(tabloidStyle: TabloidStyle, separatorStyle: SeparatorStyle, cellIdentifiers: [String]) {
        self.cellIdentifiers = cellIdentifiers
        self.separatorStyle = separatorStyle
        self.tabloidStyle = tabloidStyle
    }
}
