import UIKit

open class TabloidCellView: UITableViewCell {
    
    // MARK: - Properties
    
    open var viewModel: TabloidCellViewModel!
    
    // MARK: - Height
    
    @objc public static func height(viewModel: TabloidCellViewModel) -> CGFloat {
        return 0
    }
}
