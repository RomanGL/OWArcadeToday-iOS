//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import Foundation
import DITranquillity

final class AppDependencyManager {

    // Dependencies
    let container = DIContainer()

    // MARK: - Lifecycle

    public static let shared = AppDependencyManager()
    
    private init() {
        container.append(framework: AppFramework.self)
    }
}
