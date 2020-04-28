import ReactiveSwift
import ReactiveCocoa
import UIKit

open class TabloidView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    // MARK: - Properties
    
    private let bundleName = Bundle.main.name
    public let viewModel: TabloidViewModel
    
    // MARK: - Initialization
    
    public required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public required init(viewModel: TabloidViewModel, style: UITableView.Style) {
        self.viewModel = viewModel
        super.init(frame: .zero, style: style)
        self.register(cellIdentifiers: viewModel.cellIdentifiers)
        self.dataSource = self
        self.delegate = self
        self.reactive.reloadData <~ viewModel.elements.signal.map({ _ in })
    }
    
    // MARK: - UITableViewDataSource
    
    open func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cellViewModel = viewModel(at: indexPath) else {
            fatalError("fatalError: cellForRowAtIndexPath")
        }
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellViewModel.cellIdentifier) as? TabloidCellView else {
            fatalError("fatalError: cellForRowAtIndexPath")
        }
        
        cell.viewModel = cellViewModel
        
        return cell
    }
    
    open func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let section = viewModel.elements.value[section]
        return section.count
    }
    
    open func numberOfSections(in tableView: UITableView) -> Int {
        return viewModel.elements.value.count
    }
    
    // MARK: - UITableViewDelegate
    
    open func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        return nil
    }
    
    open func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 0
    }
    
    open func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        return nil
    }
    
    open func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 0
    }
    
    open func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let automaticDimension = UITableView.automaticDimension
        guard let bundleName = bundleName else { return automaticDimension }
        guard let cellViewModel = viewModel(at: indexPath) else { return automaticDimension }
        guard let aClass = NSClassFromString(bundleName + "." + cellViewModel.cellIdentifier) as? TabloidCellView.Type else { return automaticDimension }
        let selector = #selector(aClass.height)
        guard aClass.responds(to: selector) else { return automaticDimension }
        guard let height = aClass.perform(selector, with: cellViewModel.cellIdentifier).takeUnretainedValue() as? NSNumber else { return automaticDimension }
        guard height.floatValue > 0 else { return automaticDimension }
        return CGFloat(height.floatValue)
    }
    
    open func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let cellViewModel = viewModel(at: indexPath) else { return }
        DispatchQueue.main.async {
            self.viewModel.pipeDidSelectItem.input.send(value: cellViewModel)
        }
    }
    
    // MARK: - ViewModel At IndexPath
    
    public func viewModel(at indexPath: IndexPath) -> TabloidCellViewModel? {
        let section = viewModel.elements.value[indexPath.section]
        let value = (section.count > indexPath.row) ? section[indexPath.row] : nil
        guard let viewModel = value else { return nil }
        return viewModel
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

fileprivate extension Bundle {
    var name: String? {
        return (Bundle.main.infoDictionary?["CFBundleName"] as? String)?.replacingOccurrences(of: ".", with: "_")
    }
}
