import DifferenceKit
import UIKit

open class TabloidView: UITableView, UITableViewDelegate {
    
    public var viewModel: TabloidViewModel? {
        didSet {
            viewModel?.delegate = self
        }
    }
    
    public required init?(coder: NSCoder) {
        super.init(coder: coder)
        delegate = self
    }
    
    public init(style: UITableView.Style) {
        super.init(frame: .zero, style: style)
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
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        //guard let cellViewModel = viewModel(at: indexPath) else { return }
        //cellViewModel.didSelect.send(cellViewModel)
        //tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension TabloidView: TabloidViewModelDelegate {
    func reload(changeset: StagedChangeset<[Section<TabloidCellViewModel>]>) {
        reload(using: changeset, with: .fade) { [weak self] sections in
            guard let self = self else { return }
            self.viewModel?.set(sections: sections)
        }
    }
}
