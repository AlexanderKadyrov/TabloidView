import UIKit

fileprivate extension TabloidView {
    func viewModel(at indexPath: IndexPath) -> TabloidCellViewModel? {
        let section = viewModel.elements.value[indexPath.section]
        let value = (section.count > indexPath.row) ? section[indexPath.row] : nil
        guard let viewModel = value else { return nil }
        return viewModel
    }
}

fileprivate extension TabloidViewModel.TabloidStyle {
    var rawValue: UITableView.Style {
        switch self {
        case .grouped:
            return .grouped
        case .plain:
            return .plain
        }
    }
}

#if os(iOS)
fileprivate extension TabloidViewModel.SeparatorStyle {
    var rawValue: UITableViewCell.SeparatorStyle {
        switch self {
        case .singleLine:
            return .singleLine
        case .none:
            return .none
        }
    }
}
#endif

open class TabloidView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Properties
    
    public let viewModel: TabloidViewModel
    
    // MARK: - Initialization
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(viewModel: TabloidViewModel) {
        self.viewModel = viewModel
        super.init(frame: .zero, style: viewModel.tabloidStyle.rawValue)
        #if os(iOS)
        self.separatorStyle = viewModel.separatorStyle.rawValue
        #endif
    }
    
    // MARK: - UITableViewDataSource
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cellViewModel = viewModel(at: indexPath), let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier) as? TabloidCellView {
            cell.viewModel = cellViewModel
            return cell
        }
        fatalError("fatalError: cellForRowAtIndexPath")
    }
    
    public func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = viewModel.elements.value[section]
        return section.count
    }
    
    public func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.elements.value.count
    }
    
    // MARK: - UITableViewDelegate
    
    public func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellViewModel = viewModel(at: indexPath) else { return }
        viewModel.pipeDidSelectItem.input.send(value: cellViewModel)
    }
}
