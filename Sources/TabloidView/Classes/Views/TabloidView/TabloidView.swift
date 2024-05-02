import DifferenceKit
import UIKit

open class TabloidView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    public var viewModel: TabloidViewModel? {
        didSet {
            viewModel?.add(delegate: self)
        }
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        dataSource = self
        delegate = self
    }
    
    public init(style: UITableView.Style) {
        super.init(frame: .zero, style: style)
        dataSource = self
        delegate = self
    }
    
    public func register(cellIdentifiers: [String]) {
        guard let bundleName = Bundle.main.name else { return }
        let cellIdentifiers = cellIdentifiers.filter({ $0 != "" })
        for cellIdentifier in cellIdentifiers {
            guard let aClass = NSClassFromString(bundleName + "." + cellIdentifier) else { continue }
            register(aClass, forCellReuseIdentifier: cellIdentifier)
        }
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cellViewModel = viewModel?.sections[indexPath.section].elements[indexPath.row],
            let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier, for: indexPath) as? TabloidCellView
        else {
            return UITableViewCell()
        }
        cell.viewModel = cellViewModel
        return cell
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.sections[section].elements.count ?? .zero
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
    
    open func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        guard let cellViewModel = viewModel?.sections[indexPath.section].elements[indexPath.row] else { return }
        cellViewModel.set(selected: false, viewModel: cellViewModel)
    }
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellViewModel = viewModel?.sections[indexPath.section].elements[indexPath.row] else { return }
        cellViewModel.set(selected: true, viewModel: cellViewModel)
    }
}

extension TabloidView: TabloidViewModelDelegate {
    func reload(changeset: StagedChangeset<[Section<TabloidCellViewModel>]>, animation: UITableView.RowAnimation) {
        reload(using: changeset, with: animation) { [weak self] sections in
            guard let self = self else { return }
            self.viewModel?.set(sections: sections)
        }
    }
}
