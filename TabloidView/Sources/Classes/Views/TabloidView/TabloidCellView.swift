import UIKit

open class TabloidCellView: UITableViewCell {
    
    // MARK: - Properties
    
    open var viewModel: TabloidCellViewModel!
    
    // MARK: - Height
    
    @objc open class func height(viewModel: TabloidCellViewModel) -> NSNumber {
        return 0
    }
}
