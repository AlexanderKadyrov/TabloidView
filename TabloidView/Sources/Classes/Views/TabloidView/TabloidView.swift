import Combine
import UIKit

open class TabloidView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    private var subscriptions = Set<AnyCancellable>()
    
    public var viewModel: TabloidViewModel? {
        didSet {
            bind()
        }
    }
    
    private func bind() {
        viewModel?.sections
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
        return viewModel?.sections.value[section].count ?? .zero
    }
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.sections.value.count ?? .zero
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
    }
    
    public func viewModel(at indexPath: IndexPath) -> TabloidCellViewModel? {
        let section = viewModel?.sections.value[indexPath.section] ?? []
        let cellViewModel = (section.count > indexPath.row) ? section[indexPath.row] : nil
        return cellViewModel
    }
}
