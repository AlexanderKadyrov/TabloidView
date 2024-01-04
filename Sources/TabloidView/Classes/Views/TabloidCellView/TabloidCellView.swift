import UIKit

public protocol TabloidCellView: UITableViewCell {
    var viewModel: TabloidCellViewModel? { get set }
}
