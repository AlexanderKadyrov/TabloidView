import Foundation
import Combine

open class TabloidViewModel {
    
    @Published public var sections: [[TabloidCellViewModel]]
    
    public init() {
        sections = []
    }
}
