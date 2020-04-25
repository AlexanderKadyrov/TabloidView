import UIKit

public protocol TabloidCellViewProtocol: UITableViewCell {
    
    // MARK: - Properties
    
    associatedtype TabloidCellViewModelProtocol
    var viewModel: TabloidCellViewModelProtocol { get set }
}
