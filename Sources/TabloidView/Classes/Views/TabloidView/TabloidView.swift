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
    
    public func register(headerFooterViewReuseIdentifiers: [String]) {
        guard let bundleName = Bundle.main.name else { return }
        let headerFooterViewReuseIdentifiers = headerFooterViewReuseIdentifiers.filter({ $0 != "" })
        for headerFooterViewReuseIdentifier in headerFooterViewReuseIdentifiers {
            guard let aClass = NSClassFromString(bundleName + "." + headerFooterViewReuseIdentifier) else { continue }
            register(aClass, forHeaderFooterViewReuseIdentifier: headerFooterViewReuseIdentifier)
        }
    }
    
    public func register(cellReuseIdentifiers: [String]) {
        guard let bundleName = Bundle.main.name else { return }
        let cellReuseIdentifiers = cellReuseIdentifiers.filter({ $0 != "" })
        for cellReuseIdentifier in cellReuseIdentifiers {
            guard let aClass = NSClassFromString(bundleName + "." + cellReuseIdentifier) else { continue }
            register(aClass, forCellReuseIdentifier: cellReuseIdentifier)
        }
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel?.sections[section].elements.count ?? .zero
    }
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel?.sections.count ?? .zero
    }
    
    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        guard
            let headerViewModel = viewModel?.sections[section].header,
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: headerViewModel.identifier) as? TabloidHeaderFooterView
        else {
            return nil
        }
        view.viewModel = headerViewModel
        return view
    }
    
    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        guard let headerViewModel = viewModel?.sections[section].header else { return .zero }
        return headerViewModel.size?.height ?? UITableView.automaticDimension
    }
    
    open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        guard
            let footerViewModel = viewModel?.sections[section].footer,
            let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: footerViewModel.identifier) as? TabloidHeaderFooterView
        else {
            return nil
        }
        view.viewModel = footerViewModel
        return view
    }
    
    open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        guard let footerViewModel = viewModel?.sections[section].footer else { return .zero }
        return footerViewModel.size?.height ?? UITableView.automaticDimension
    }
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard
            let cellViewModel = viewModel?.sections[indexPath.section].elements[indexPath.row],
            let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.identifier, for: indexPath) as? TabloidCellView
        else {
            return UITableViewCell()
        }
        cell.viewModel = cellViewModel
        return cell
    }
    
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        guard let cellViewModel = viewModel?.sections[indexPath.section].elements[indexPath.row] else { return .zero }
        return cellViewModel.size?.height ?? UITableView.automaticDimension
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
