//
// Copyright (c) 2020 Roman Gladkikh. All rights reserved.  
// Licensed under the MIT License. See LICENSE file in the project root for full license information.  
//

import Foundation
import PromiseKit
import Alamofire
import AppCoreKit

public final class OWArcadeApi {

    // Dependencies
    private let endpoints: OWArcadeApiEndpoints
    private let storage: IKeyValueStorage

    // State
    private var runtimeCachedToday: OWArcades?

    // MARK: - Lifecycle

    public init(endpoints: OWArcadeApiEndpoints,
                storage: IKeyValueStorage) {
        self.endpoints = endpoints
        self.storage = storage
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
        if let arcades = cachedToday {
            return .value(arcades)
        }

        return loadToday()
    }
}

// MARK: - Private API

private extension OWArcadeApi {
    var cachedToday: OWArcades? {
        get {
            if let runtimeCachedToday = self.runtimeCachedToday {
                return runtimeCachedToday
            }

            let cache: OWArcadesCache? = storage.get(by: OWArcadesCache.storageKey)
            return cache?.arcades
        }
        set {
            self.runtimeCachedToday = newValue
            if let newValue = newValue {
                storage.set(OWArcadesCache(arcades: newValue))
            } else {
                storage.remove(by: OWArcadesCache.storageKey)
            }
        }
    }

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
        self.cachedToday = arcades
        return .value(arcades)
    }
}
