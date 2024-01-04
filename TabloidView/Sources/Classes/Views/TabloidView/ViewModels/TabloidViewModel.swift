import Foundation
import Combine

public class TabloidViewModel {
    
    @Published var sections: [[TabloidCellViewModel]]
    
    public init() {
        sections = []
    }
}
