import DifferenceKit
import Foundation
import UIKit

protocol TabloidViewModelDelegate: AnyObject {
    func reload(changeset: StagedChangeset<[Section<TabloidCellViewModel>]>, animation: UITableView.RowAnimation)
}

open class TabloidViewModel {
    
    private(set) var sections: [Section<TabloidCellViewModel>] = []
    
    weak var delegate: TabloidViewModelDelegate?
    
    public init() {
        
    }
    
    public func reload(sections: [Section<TabloidCellViewModel>], animation: UITableView.RowAnimation) {
        let changeset = StagedChangeset(source: self.sections, target: sections)
        delegate?.reload(changeset: changeset, animation: animation)
    }
    
    func set(sections: [Section<TabloidCellViewModel>]) {
        self.sections = sections
    }
}
