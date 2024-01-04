import UIKit

open class TabloidCellView: UITableViewCell {
    
    public var viewModel: TabloidCellViewModel? {
        didSet {
            fill(viewModel: viewModel)
        }
    }
    
    open func fill(viewModel: TabloidCellViewModel?) {
        
    }
}
