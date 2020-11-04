//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import Foundation
import DITranquillity

public final class AppCorePart: DIPart {
    public static func load(container: DIContainer) {
        container.register { UserDefaultsStorage(userDefaults: UserDefaults.standard) }
            .as(check: IKeyValueStorage.self) { $0 }
            .lifetime(.single)
    }
}
