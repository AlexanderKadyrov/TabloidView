import UIKit

public protocol TabloidCellViewProtocol: UITableViewCell {
    
    // MARK: - Properties
    
    associatedtype T: TabloidCellViewModelProtocol
    var viewModel: T! { get set }
}

open class TabloidCellView: UITableViewCell, TabloidCellViewProtocol {
    
    // MARK: - Properties
    
    public var viewModel: TabloidCellViewModel!
}
