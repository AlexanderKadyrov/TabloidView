import DifferenceKit
import Foundation

protocol TabloidViewModelDelegate: AnyObject {
    func reload(changeset: StagedChangeset<[Section<TabloidCellViewModel>]>)
}

open class TabloidViewModel {
    
    private(set) var sections: [Section<TabloidCellViewModel>] = []
    
    weak var delegate: TabloidViewModelDelegate?
    
    public init() {
        
    }
    
    public func reload(sections: [Section<TabloidCellViewModel>]) {
        let changeset = StagedChangeset(source: self.sections, target: sections)
        delegate?.reload(changeset: changeset)
    }
    
    func set(sections: [Section<TabloidCellViewModel>]) {
        self.sections = sections
    }
}
