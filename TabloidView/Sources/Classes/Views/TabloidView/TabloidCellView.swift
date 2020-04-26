import UIKit

public protocol TabloidCellViewProtocol: UITableViewCell {
    
    // MARK: - Properties
    
    associatedtype TabloidCellViewModelProtocol
    var viewModel: TabloidCellViewModelProtocol! { get set }
}

open class TabloidCellView: UITableViewCell, TabloidCellViewProtocol {
    
    // MARK: - Properties
    
    public var viewModel: TabloidCellViewModel!
}
