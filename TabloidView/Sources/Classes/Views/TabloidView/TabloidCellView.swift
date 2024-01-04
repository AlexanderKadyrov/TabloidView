import UIKit

public protocol TabloidCellViewProtocol: UITableViewCell {
    var viewModel: TabloidCellViewModelProtocol? { get set }
}
