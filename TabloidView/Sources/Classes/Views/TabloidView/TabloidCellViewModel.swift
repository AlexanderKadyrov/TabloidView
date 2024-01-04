import Foundation
import Combine

public protocol TabloidCellViewModel {
    var cellIdentifier: String { get set }
    var didSelect: PassthroughSubject<TabloidCellViewModel, Never> { get set }
}
