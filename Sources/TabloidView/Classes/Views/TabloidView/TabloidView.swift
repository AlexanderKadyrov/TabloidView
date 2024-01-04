import Combine
import UIKit

open class TabloidView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    private var subscriptions = Set<AnyCancellable>()
    
    public var viewModel: TabloidViewModel? {
        didSet {
            bind()
        }
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        configureItems()
    }
    
    public init(style: UITableView.Style) {
        super.init(frame: .zero, style: style)
        configureItems()
    }
    
    private func configureItems() {
        dataSource = self
        delegate = self
    }
    
    private func bind() {
        viewModel?.$sections
            .sink { [weak self] sections in
                let cellIdentifiers = sections
                    .flatMap { $0 }
                    .map { $0.cellIdentifier }
                self?.register(cellIdentifiers: cellIdentifiers)
                self?.reloadData()
            }
            .store(in: &subscriptions)
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cellViewModel = viewModel(at: indexPath),
            let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier, for: indexPath) as? TabloidCellView
        else {
            return UITableViewCell()
        }
        cell.viewModel = cellViewModel
        return cell
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.sections[section].count ?? .zero
    }
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.sections.count ?? .zero
    }
    
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
        cellViewModel.didSelect.send(cellViewModel)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    
    public func viewModel(at indexPath: IndexPath) -> TabloidCellViewModel? {
        let section = viewModel?.sections[indexPath.section] ?? []
        let cellViewModel = (section.count > indexPath.row) ? section[indexPath.row] : nil
        return cellViewModel
    }
}
