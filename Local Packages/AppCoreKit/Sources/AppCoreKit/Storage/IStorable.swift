//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import Foundation

/// Represents a storable entity.
public protocol IStorable where Self: Codable {
    
    /// Gets the unique storage key.
    var storageKey: String { get }
}
