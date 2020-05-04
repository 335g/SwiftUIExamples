//  Copyright © 2020 335g. All rights reserved.

import Foundation
import Combine

struct IdentifiableWrapped<T> {
    let inner: T
    
    init(_ inner: T) {
        self.inner = inner
    }
}

extension IdentifiableWrapped: Identifiable where T: Hashable {
    var id: T {
        return self.inner
    }
}

struct Wrapped<T> {
    let inner: T
    
    init(_ inner: T) {
        self.inner = inner
    }
}
