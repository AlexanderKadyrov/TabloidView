import UIKit

open class TabloidView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    public var viewModel: TabloidViewModelProtocol?
    private let bundleName = Bundle.main.name
    
    // MARK: - Initialization
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public init(style: UITableView.Style) {
        super.init(frame: .zero, style: style)
        self.dataSource = self
        self.delegate = self
    }
    
    // MARK: - UITableViewDataSource
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cellViewModel = viewModel(at: indexPath),
            let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier, for: indexPath) as? TabloidCellViewProtocol
        else {
            return UITableViewCell()
        }
        cell.viewModel = cellViewModel
        return cell
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.sections.value[section].count ?? .zero
    }
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.sections.value.count ?? .zero
    }
    
    // MARK: - UITableViewDelegate
    
    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return .zero
    }
    
    open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return .zero
    }
    
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellViewModel = viewModel(at: indexPath) else { return }
        /*
        DispatchQueue.main.async {
            self.viewModel.pipeDidSelectItem.input.send(value: cellViewModel)
        }*/
    }
    
    // MARK: - ViewModel At IndexPath
    
    public func viewModel(at indexPath: IndexPath) -> TabloidCellViewModelProtocol? {
        let section = viewModel?.sections.value[indexPath.section] ?? []
        let cellViewModel = (section.count > indexPath.row) ? section[indexPath.row] : nil
        return cellViewModel
    }
}

fileprivate extension TabloidView {
    func register(cellIdentifiers: [String]) {
        guard let bundleName = bundleName else { return }
        let _cellIdentifiers = cellIdentifiers.filter({ $0 != "" })
        for identifier in _cellIdentifiers {
            if let aClass = NSClassFromString(bundleName + "." + identifier) {
                register(aClass, forCellReuseIdentifier: identifier)
            }
        }
    }
}
