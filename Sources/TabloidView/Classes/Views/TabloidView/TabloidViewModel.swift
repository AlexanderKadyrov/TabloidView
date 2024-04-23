import DifferenceKit
import Foundation

protocol TabloidViewModelDelegate: AnyObject {
    func reload(changeset: StagedChangeset<[Section<TabloidCellViewModel>]>)
}

open class TabloidViewModel {
    
    weak var delegate: TabloidViewModelDelegate?
    
    var sections: [Section<TabloidCellViewModel>] = [] {
        didSet {
            reload(oldValue: oldValue, newValue: sections)
        }
    }
    
    private func reload(oldValue: [Section<TabloidCellViewModel>], newValue: [Section<TabloidCellViewModel>]) {
        let changeset = StagedChangeset(source: oldValue, target: newValue)
        delegate?.reload(changeset: changeset)
    }
}
