//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import Foundation
import SwiftUI

@propertyWrapper
struct Injected<T> {
    let wrappedValue: T

    init() {
        wrappedValue = AppDependencyManager.shared.container.resolve()
    }
}
