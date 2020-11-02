//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import Foundation

/// Represents the API endpoints definition.
public struct OWArcadeApiEndpoints {

    /// Gets the root API url.
    public let root: String

    /// Gets the name of the today API endpoint.
    public let todayEndpoint: String
}

// MARK: - Defaults

public extension OWArcadeApiEndpoints {

    /// Returns the Overwatch arcade API endpoints definition.
    static var overwatchEndpoint: OWArcadeApiEndpoints {
        return OWArcadeApiEndpoints(root: "https://overwatcharcade.today/api/overwatch/",
                                    todayEndpoint: "today")
    }

    /// Returns the Overwatch 2 arcade API endpoints definition.
    static var overwatch2Endpoint: OWArcadeApiEndpoints {
        return OWArcadeApiEndpoints(root: "https://overwatcharcade.today/api/overwatch2/",
                                    todayEndpoint: "today")
    }
}
