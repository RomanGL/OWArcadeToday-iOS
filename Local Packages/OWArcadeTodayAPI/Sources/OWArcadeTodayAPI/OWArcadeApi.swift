//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import Foundation
import PromiseKit
import Alamofire

public final class OWArcadeApi {

    // Dependencies
    private let endpoints: OWArcadeApiEndpoints

    // State
    private var runtimeCachedToday: OWArcades?

    // MARK: - Lifecycle

    public init(endpoints: OWArcadeApiEndpoints) {
        self.endpoints = endpoints
    }
}

// MARK: - Public API

public extension OWArcadeApi {

    func loadToday() -> Promise<OWArcades> {
        return self
            .load(path: endpoints.root + endpoints.todayEndpoint)
            .then { self.cache(arcades: $0) }
    }

    func obtainToday() -> Promise<OWArcades> {
        if let arcades = runtimeCachedToday {
            return .value(arcades)
        }

        return loadToday()
    }
}

// MARK: - Private API

private extension OWArcadeApi {
    func load<Payload: Decodable>(path: String) -> Promise<Payload> {
        return Promise { seal in
            AF.request(path)
                .validate()
                .responseDecodable(of: Payload.self) { response in
                    switch response.result {
                    case .success(let payload):
                        seal.fulfill(payload)
                    case .failure(let error):
                        seal.reject(error)
                    }
                }
        }
    }

    func cache(arcades: OWArcades) -> Guarantee<OWArcades> {
        self.runtimeCachedToday = arcades
        return .value(arcades)
    }
}
