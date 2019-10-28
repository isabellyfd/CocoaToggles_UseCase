//
//  CTService.swift
//  CocoaToggles
//
//  Created by Isabelly Damascena on 18/10/19.
//

import Foundation


class CTService {
    private let logger = CTLogger()
    private let session = URLSession.shared
    
    
    private let baseURL = "https://murmuring-hamlet-24337.herokuapp.com"
    private let allApplicationsEndpoint = "/v1/toggle-service/my-apps/"
    private let allTogglesEndpoint = "/v1/toggle-service/toggles/"
    
    
    func getAllToggles(for applicationId: String, callback: @escaping ([CTToggle]?) -> Void) {
        let fullURL = "\(baseURL)\(allTogglesEndpoint)\(applicationId)"
        let url = URL(string: fullURL)!
        
        let task = session.dataTask(with: url) { (data, response, error) in
            do {
                let decoder = JSONDecoder()
                let toggles = try decoder.decode([CTToggle].self, from: data!)
                self.logger.info(value: toggles)
                callback(toggles)
            } catch {
                self.logger.info(value: "Could not parse JSON for request \(fullURL)")
                callback(nil)
            }
        }
        
        task.resume()
    }
    
    func getAllApplications(for userId: String, callback: @escaping ([CTApplication]?) -> Void ) {
        let fullURL = "\(baseURL)\(allApplicationsEndpoint)\(userId)"
        let url = URL(string: fullURL)!
        
        let task = session.dataTask(with: url) { (data, response, error) in
            do {
                let decoder = JSONDecoder()
                let users = try decoder.decode([CTApplication].self, from: data!)
                self.logger.info(value: users)
                callback(users)
            } catch {
                self.logger.info(value: "Could not parse JSON for request \(fullURL)")
                callback(nil)
            }
            
        }
        
        task.resume()
    }
}
