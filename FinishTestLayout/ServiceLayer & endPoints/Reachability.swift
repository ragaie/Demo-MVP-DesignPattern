//
//  Reachability.swift
//  FinishTestLayout
//
//  Created by Ragaie Alfy on 1/27/21.
//

import Network

struct Internet {
    
    private static let monitor = NWPathMonitor()
    /// Monitors internet connectivity changes. Updates with every change in connectivity.
    /// Updates variables for availability and if it's expensive (cellular).
    static func start(inComplete: @escaping  (NWPath.Status)->Void) {
        guard monitor.pathUpdateHandler == nil else { return }
        monitor.pathUpdateHandler = { update in
            inComplete(update.status)
        }
        monitor.start(queue: DispatchQueue(label: "InternetMonitor"))
    }
}
