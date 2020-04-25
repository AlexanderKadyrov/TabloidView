import UIKit

public protocol TabloidViewProtocol: UITableView {
    
    // MARK: - Properties
    
    associatedtype TabloidViewModelProtocol
    var viewModel: TabloidViewModelProtocol { get }
    
    // MARK: - Initialization
    
    init(viewModel: TabloidViewModelProtocol, style: UITableView.Style)
}