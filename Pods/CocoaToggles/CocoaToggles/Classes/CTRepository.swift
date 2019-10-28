//
//  CTRepository.swift
//  CocoaToggles
//
//  Created by Isabelly Damascena on 18/10/19.
//

import Foundation

public class CTRepository {
    private var toggles : [CTToggle]?
    private let logger = CTLogger()
    
    init(toggles: [CTToggle]?){
        self.toggles = toggles
    }
    
    public func isToggleOn(name: String) -> Bool? {
        let toggle  = self.toggles?.filter { $0.name == name}.first
        
        if toggle != nil {
            self.logger.info(value: "Framework found toggle \(toggle!)")
            return toggle!.value
        }
        
        self.logger.info(value: "Could not find the toggle with value \(name)")
        return nil
    }
}
