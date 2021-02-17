//
//  URLs.swift
//  Templars_iOS_SDK
//
//  Created by Tochi on 09/01/2021.
//

import Foundation

struct URLs {
    
    
    /// Collection of Templars API URLs
    struct Templars{
        private static let baseURL = "http://templars-api.herokuapp.com"
        
        //MARK: Category APIs
        static let getPublicDocumentCategories = "\(baseURL)/api/v1/document-categories/public"
        
        //MARK: Documents API
        static let getDocuments = "\(baseURL)/api/v1/documents/me"
        static let getDocument = "\(baseURL)/api/v1/documents/%@"
        static let createDocument = "\(baseURL)/api/v1/documents"
        static let updateDocument = "\(baseURL)/api/v1/documents/%@"
        static let deleteDocument = "\(baseURL)/api​/v1​/documents/%@"
        static let updateDocumentPayment = "\(baseURL)/api​/v1​/documents/%@/payment"
        
        
        
        //MARK: Bussiness Registeration API
        static let getRegistration = "\(baseURL)/api/v1/registrations/%@"
        static let getRegistrations = "\(baseURL)/api/v1/registrations/me"
        static let getRegistrationCategories = "\(baseURL)/api/v1/document-categories/registration"
        static let createRegistration = "\(baseURL)/api/v1/registrations"
        
        
        //MARK: Sessions API
        static let getSession = "\(baseURL)/api/v1/sessions/%@"
        static let getSessions = "\(baseURL)/api/v1/sessions/me"
        static let createSession = "\(baseURL)/api/v1/sessions"
        static let cancelSession = "\(baseURL)/api/v1/sessions/%@/cancel"
        static let endSession = "\(baseURL)/api/v1/sessions/%@/end"
        static let rescheduleSession = "\(baseURL)/api/v1/sessions/%@/reschedule"
        
        //MARK: Subscribtion Management APIs
        static let getSubscriptions = "\(baseURL)/api/v1/subscriptions"
        static let createSubscriptions = "\(baseURL)/api/v1/subscriptions"
        static let getMySubscriptions = "\(baseURL)/api​/v1​/subscriptions​/me"
        static let getActiveSubscription = "\(baseURL)/api/v1/subscriptions/me/active"
        static let endSubscription = "\(baseURL)/api​/v1​/subscriptions​/%@/end"
        
        //MARK: Payment APIs
        
        //MARK: Profile APIs
        static let userProfile = "\(baseURL)/api/v1/users/%@"
        static let toggleState = "\(baseURL)/api/v1/users/%@/toggle-status"
    }
    
    
}
