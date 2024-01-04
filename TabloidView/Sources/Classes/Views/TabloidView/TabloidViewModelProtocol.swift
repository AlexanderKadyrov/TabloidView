import Foundation
import Combine

public protocol TabloidViewModelProtocol {
    var sections: CurrentValueSubject<[[TabloidCellViewModelProtocol]], Never> { get set }
}
