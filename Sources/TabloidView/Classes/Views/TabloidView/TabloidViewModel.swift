import DifferenceKit
import Foundation
import UIKit

protocol TabloidViewModelDelegate: AnyObject {
    func reload(changeset: StagedChangeset<[Section<TabloidCellViewModel>]>, animation: UITableView.RowAnimation)
}

open class TabloidViewModel {
    
    private let multicastDelegate = MulticastDelegate<TabloidViewModelDelegate>()
    
    public private(set) var sections: [Section<TabloidCellViewModel>] = []
    
    public init() {
        
    }
    
    public func reload(sections: [Section<TabloidCellViewModel>], animation: UITableView.RowAnimation) {
        let changeset = StagedChangeset(source: self.sections, target: sections)
        multicastDelegate.invoke { $0.reload(changeset: changeset, animation: animation) }
    }
    
    func add(delegate: TabloidViewModelDelegate) {
        multicastDelegate.add(delegate)
    }
    
    func set(sections: [Section<TabloidCellViewModel>]) {
        self.sections = sections
    }
}
