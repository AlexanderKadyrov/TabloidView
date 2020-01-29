import UIKit

open class TabloidCellView: UITableViewCell {
    
    // MARK: - Properties
    
    open var viewModel: TabloidCellViewModel!
    
    // MARK: - Initialization
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        contentView.backgroundColor = .clear
        backgroundColor = .clear
    }
    
    // MARK: - Height
    
    @objc open class func height(viewModel: TabloidCellViewModel) -> NSNumber {
        return 0
    }
}
