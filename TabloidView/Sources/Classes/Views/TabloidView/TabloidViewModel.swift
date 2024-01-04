import Foundation
import Combine

public protocol TabloidViewModel {
    var sections: CurrentValueSubject<[[TabloidCellViewModel]], Never> { get set }
}
