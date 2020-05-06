//  Copyright © 2020 335g. All rights reserved.

import Foundation
import SwiftUI

struct Wrapped<T> {
    var inner: T
    
    init(_ inner: T) {
        self.inner = inner
    }
}

extension Wrapped: Equatable where T: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        return lhs.inner == rhs.inner
    }
}

extension Wrapped: Hashable where T: Hashable {}
