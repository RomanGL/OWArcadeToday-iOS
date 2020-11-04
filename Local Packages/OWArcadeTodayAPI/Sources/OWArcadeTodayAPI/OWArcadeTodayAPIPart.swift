//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import Foundation
import DITranquillity

public final class OWArcadeTodayAPIPart: DIPart {
    public static func load(container: DIContainer) {
        container.register { OWArcadeApi(endpoints: .overwatchEndpoint, storage: $0) }
            .lifetime(.single)
    }
}
