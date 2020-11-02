//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import Foundation
import AppCoreKit

struct OWArcadesCache: Codable, IStorable {
    static let storageKey = "com.romangl.OWArcadeToday.todayArcades"
    var storageKey: String { OWArcadesCache.storageKey }

    let arcades: OWArcades
}
