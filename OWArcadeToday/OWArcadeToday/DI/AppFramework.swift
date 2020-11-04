//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import Foundation
import DITranquillity
import OWArcadeTodayAPI
import AppCoreKit

final class AppFramework: DIFramework {
    static func load(container: DIContainer) {
        loadExternalParts(container: container)
        loadInternalParts(container: container)
    }
}

// MARK: - Private API

private extension AppFramework {
    static func loadExternalParts(container: DIContainer) {
        container.append(part: AppCorePart.self)
        container.append(part: OWArcadeTodayAPIPart.self)
    }

    static func loadInternalParts(container: DIContainer) {
        container.register(TodayView.init)
        container.register(TodayViewModel.init)
            .lifetime(.single)
    }
}
