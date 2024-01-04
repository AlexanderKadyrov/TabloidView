import Foundation
import Combine

public protocol TabloidViewModelProtocol {
    var sections: CurrentValueSubject<[[TabloidCellViewModel]], Never> { get set }
}
