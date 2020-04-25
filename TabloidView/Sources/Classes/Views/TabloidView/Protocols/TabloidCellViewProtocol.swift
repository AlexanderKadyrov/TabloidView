import UIKit

public protocol TabloidCellViewProtocol: UITableViewCell {
    
    // MARK: - Properties
    
    associatedtype TabloidCellViewModelProtocol
    var viewModel: TabloidCellViewModelProtocol { get set }
    
    // MARK: - Height
    
    static func height(viewModel: TabloidCellViewModelProtocol) -> NSNumber
}
