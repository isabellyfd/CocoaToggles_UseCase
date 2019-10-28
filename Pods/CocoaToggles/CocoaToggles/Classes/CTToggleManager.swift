//
//  CTToggleManager.swift
//  CocoaToggles
//
//  Created by Isabelly Damascena on 18/10/19.
//

import Foundation

public typealias CTConfiguration = (userId: String, applicationId: String)

open class CTToggleManager {
    private let configuration : CTConfiguration
    private let service = CTService()
    private let logger = CTLogger()
    
    public var delegate : CTTogglesDelegate?
    
    public init(configuration: CTConfiguration) {
        self.configuration = configuration
    }
    
    public func config() {
        self.logger.info(value: "Starting configuration for \(configuration.userId)")
        service.getAllApplications(for: configuration.userId, callback: {
            (applications) in

            if let applications = applications {
                let applicationFilter = applications.filter { $0.id == self.configuration.applicationId }
                
                if applicationFilter.count > 0 {
                    self.logger.info(value: "User \(self.configuration.userId) can access application id = \(self.configuration.applicationId)")
                    self.service.getAllToggles(for: self.configuration.applicationId, callback: { (toggles) in
                        self.delegate?.getTogglesFrom(repository: CTRepository(toggles: toggles))
                    })
                }
            }
            self.delegate?.getTogglesFrom(repository: CTRepository(toggles: nil))
        })
    }
}
