import UIKit

public protocol TabloidCellViewProtocol: UITableViewCell {
    
    // MARK: - Properties
    
    associatedtype TabloidCellViewModelProtocol
    var viewModel: TabloidCellViewModelProtocol! { get set }
    
    // MARK: - Height
    
    static func height(viewModel: TabloidCellViewModelProtocol) -> CGFloat
}

open class TabloidCellView: UITableViewCell, TabloidCellViewProtocol {
    
    // MARK: - Properties
    
    public var viewModel: TabloidCellViewModel!
    
    // MARK: - Height
    
    public static func height(viewModel: TabloidCellViewModel) -> CGFloat {
        return 0
    }
}
