//
//  UserProfile.swift
//  MyTimeSW
//
//  Created by Timothy Santiago on 18/03/2019.
//  Copyright © 2019 Timothy Santiago. All rights reserved.
//
import Foundation
import SwiftyJSON
import SharkORM

class UserProfile: SRKObject {
    @objc dynamic var aboutMe, accountID, address, alias: String?
    @objc dynamic var badgeText, bannerPhotoURL, callCenterID, city: String?
    @objc dynamic var communityNickname, companyName, contactID, contactIDC: String?
    @objc dynamic var contactRecordC, country, createdByID, createdDate: String?
    @objc dynamic var delegatedApproverID, department, digestFrequency, division: String?
    @objc dynamic var email, emailEncodingKey: String?
    @objc dynamic var emailPreferencesAutoBcc: Bool = false
    @objc dynamic var emailPreferencesAutoBccStayInTouch: Bool = false
    @objc dynamic var emailPreferencesStayInTouchReminder: Bool = false
    @objc dynamic var employeeNumber, userProfileExtension, fax, federationIdentifier: String?
    @objc dynamic var firstName: String?
    @objc dynamic var forecastEnabled: Bool = false
    @objc dynamic var fullPhotoURL: String?
    @objc dynamic var geocodeAccuracy, userId: String?
    @objc dynamic var isActive: Bool = false
    @objc dynamic var isEXTIndicatorVisible: Bool = false
    @objc dynamic var isPortalEnabled: Bool = false
    @objc dynamic var isProfilePhotoActive: Bool = false
    @objc dynamic var languageLocaleKey, lastLoginDate, lastModifiedByID, lastModifiedDate: String?
    @objc dynamic var lastName, lastReferencedDate, lastViewedDate, latitude: String?
    @objc dynamic var localeSidKey, longitude, managerID, mediumBannerPhotoURL: String?
    @objc dynamic var mediumPhotoURL: String?
    @objc dynamic var middleName, mobilePhone, name, offlinePDATrialExpirationDate: String?
    @objc dynamic var offlineTrialExpirationDate, outOfOfficeMessage, phone, portalRole: String?
    @objc dynamic var postalCode: String?
    @objc dynamic var receivesAdminInfoEmails:Bool = false
    @objc dynamic var receivesInfoEmails: Bool = false
    @objc dynamic var senderEmail, senderName, signature, smallBannerPhotoURL: String?
    @objc dynamic var smallPhotoURL: String?
    @objc dynamic var state, stayInTouchNote, stayInTouchSignature, stayInTouchSubject: String?
    @objc dynamic var street, suffix, systemModstamp, timeZoneSidKey: String?
    @objc dynamic var title, username, userRoleID, userType: String?
    
    enum CodingKeys: String, CodingKey {
        case aboutMe = "AboutMe"
        case accountID = "AccountId"
        case address = "Address"
        case alias = "Alias"
        case badgeText = "BadgeText"
        case bannerPhotoURL = "BannerPhotoUrl"
        case callCenterID = "CallCenterId"
        case city = "City"
        case communityNickname = "CommunityNickname"
        case companyName = "CompanyName"
        case contactID = "ContactId"
        case contactIDC = "Contact_Id__c"
        case contactRecordC = "Contact_Record__c"
        case country = "Country"
        case createdByID = "CreatedById"
        case createdDate = "CreatedDate"
        case delegatedApproverID = "DelegatedApproverId"
        case department = "Department"
        case digestFrequency = "DigestFrequency"
        case division = "Division"
        case email = "Email"
        case emailEncodingKey = "EmailEncodingKey"
        case emailPreferencesAutoBcc = "EmailPreferencesAutoBcc"
        case emailPreferencesAutoBccStayInTouch = "EmailPreferencesAutoBccStayInTouch"
        case emailPreferencesStayInTouchReminder = "EmailPreferencesStayInTouchReminder"
        case employeeNumber = "EmployeeNumber"
        case userProfileExtension = "Extension"
        case fax = "Fax"
        case federationIdentifier = "FederationIdentifier"
        case firstName = "FirstName"
        case forecastEnabled = "ForecastEnabled"
        case fullPhotoURL = "FullPhotoUrl"
        case geocodeAccuracy = "GeocodeAccuracy"
        case userId = "Id"
        case isActive = "IsActive"
        case isEXTIndicatorVisible = "IsExtIndicatorVisible"
        case isPortalEnabled = "IsPortalEnabled"
        case isProfilePhotoActive = "IsProfilePhotoActive"
        case languageLocaleKey = "LanguageLocaleKey"
        case lastLoginDate = "LastLoginDate"
        case lastModifiedByID = "LastModifiedById"
        case lastModifiedDate = "LastModifiedDate"
        case lastName = "LastName"
        case lastReferencedDate = "LastReferencedDate"
        case lastViewedDate = "LastViewedDate"
        case latitude = "Latitude"
        case localeSidKey = "LocaleSidKey"
        case longitude = "Longitude"
        case managerID = "ManagerId"
        case mediumBannerPhotoURL = "MediumBannerPhotoUrl"
        case mediumPhotoURL = "MediumPhotoUrl"
        case middleName = "MiddleName"
        case mobilePhone = "MobilePhone"
        case name = "Name"
        case offlinePDATrialExpirationDate = "OfflinePdaTrialExpirationDate"
        case offlineTrialExpirationDate = "OfflineTrialExpirationDate"
        case outOfOfficeMessage = "OutOfOfficeMessage"
        case phone = "Phone"
        case portalRole = "PortalRole"
        case postalCode = "PostalCode"
        case receivesAdminInfoEmails = "ReceivesAdminInfoEmails"
        case receivesInfoEmails = "ReceivesInfoEmails"
        case senderEmail = "SenderEmail"
        case senderName = "SenderName"
        case signature = "Signature"
        case smallBannerPhotoURL = "SmallBannerPhotoUrl"
        case smallPhotoURL = "SmallPhotoUrl"
        case state = "State"
        case stayInTouchNote = "StayInTouchNote"
        case stayInTouchSignature = "StayInTouchSignature"
        case stayInTouchSubject = "StayInTouchSubject"
        case street = "Street"
        case suffix = "Suffix"
        case systemModstamp = "SystemModstamp"
        case timeZoneSidKey = "TimeZoneSidKey"
        case title = "Title"
        case username = "Username"
        case userRoleID = "UserRoleId"
        case userType = "UserType"
    }
    
    func loadFrom(json: JSON) -> UserProfile {
        self.firstName = json[CodingKeys.firstName.stringValue].string
        self.lastName = json[CodingKeys.lastName.stringValue].string
        self.aboutMe = json[CodingKeys.aboutMe.stringValue].string
        self.accountID = json[CodingKeys.accountID.stringValue].string
        self.address = json[CodingKeys.address.stringValue].string
        self.alias = json[CodingKeys.alias.stringValue].string
        self.badgeText = json[CodingKeys.badgeText.stringValue].string
        self.bannerPhotoURL = json[CodingKeys.bannerPhotoURL.stringValue].string
        self.callCenterID = json[CodingKeys.callCenterID.stringValue].string
        self.city = json[CodingKeys.city.stringValue].string
        self.communityNickname = json[CodingKeys.communityNickname.stringValue].string
        self.companyName = json[CodingKeys.companyName.stringValue].string
        self.contactID = json[CodingKeys.contactID.stringValue].string
        self.contactIDC = json[CodingKeys.contactIDC.stringValue].string
        self.contactRecordC = json[CodingKeys.contactRecordC.stringValue].string
        self.country = json[CodingKeys.country.stringValue].string
        self.createdByID = json[CodingKeys.createdByID.stringValue].string
        self.createdDate = json[CodingKeys.createdDate.stringValue].string
        self.delegatedApproverID = json[CodingKeys.delegatedApproverID.stringValue].string
        self.department = json[CodingKeys.department.stringValue].string
        self.digestFrequency = json[CodingKeys.digestFrequency.stringValue].string
        self.division = json[CodingKeys.division.stringValue].string
        self.email = json[CodingKeys.email.stringValue].string
        self.emailEncodingKey = json[CodingKeys.emailEncodingKey.stringValue].string
        self.emailPreferencesAutoBcc = json[CodingKeys.emailPreferencesAutoBcc.stringValue].boolValue
        self.emailPreferencesAutoBccStayInTouch = json[CodingKeys.emailPreferencesAutoBccStayInTouch.stringValue].boolValue
        self.emailPreferencesStayInTouchReminder = json[CodingKeys.emailPreferencesStayInTouchReminder.stringValue].boolValue
        self.employeeNumber = json[CodingKeys.employeeNumber.stringValue].string
        self.userProfileExtension = json[CodingKeys.userProfileExtension.stringValue].string
        self.fax = json[CodingKeys.fax.stringValue].string
        self.federationIdentifier = json[CodingKeys.federationIdentifier.stringValue].string
        self.forecastEnabled = json[CodingKeys.forecastEnabled.stringValue].boolValue
        self.fullPhotoURL = json[CodingKeys.fullPhotoURL.stringValue].string
        self.geocodeAccuracy = json[CodingKeys.geocodeAccuracy.stringValue].string
        self.userId = json[CodingKeys.userId.stringValue].string
        self.isActive = json[CodingKeys.isActive.stringValue].boolValue
        self.isEXTIndicatorVisible = json[CodingKeys.isEXTIndicatorVisible.stringValue].boolValue
        self.isPortalEnabled = json[CodingKeys.isPortalEnabled.stringValue].boolValue
        self.isProfilePhotoActive = json[CodingKeys.isProfilePhotoActive.stringValue].boolValue
        self.languageLocaleKey = json[CodingKeys.languageLocaleKey.stringValue].string
        self.lastLoginDate = json[CodingKeys.lastLoginDate.stringValue].string
        self.lastModifiedByID = json[CodingKeys.lastModifiedByID.stringValue].string
        self.lastModifiedDate = json[CodingKeys.lastModifiedDate.stringValue].string
        self.lastReferencedDate = json[CodingKeys.lastReferencedDate.stringValue].string
        self.lastViewedDate = json[CodingKeys.lastViewedDate.stringValue].string
        self.latitude = json[CodingKeys.latitude.stringValue].string
        self.localeSidKey = json[CodingKeys.localeSidKey.stringValue].string
        self.longitude = json[CodingKeys.longitude.stringValue].string
        self.managerID = json[CodingKeys.managerID.stringValue].string
        self.mediumBannerPhotoURL = json[CodingKeys.mediumBannerPhotoURL.stringValue].string
        self.mediumPhotoURL = json[CodingKeys.mediumPhotoURL.stringValue].string
        self.middleName = json[CodingKeys.middleName.stringValue].string
        self.mobilePhone = json[CodingKeys.mobilePhone.stringValue].string
        self.name = json[CodingKeys.name.stringValue].string
        self.offlinePDATrialExpirationDate = json[CodingKeys.offlinePDATrialExpirationDate.stringValue].string
        self.offlineTrialExpirationDate = json[CodingKeys.offlineTrialExpirationDate.stringValue].string
        self.outOfOfficeMessage = json[CodingKeys.outOfOfficeMessage.stringValue].string
        self.phone = json[CodingKeys.phone.stringValue].string
        self.portalRole = json[CodingKeys.portalRole.stringValue].string
        self.postalCode = json[CodingKeys.postalCode.stringValue].string
        self.receivesAdminInfoEmails = json[CodingKeys.receivesAdminInfoEmails.stringValue].boolValue
        self.receivesInfoEmails = json[CodingKeys.receivesInfoEmails.stringValue].boolValue
        self.senderEmail = json[CodingKeys.senderEmail.stringValue].string
        self.senderName = json[CodingKeys.senderName.stringValue].string
        self.signature = json[CodingKeys.signature.stringValue].string
        self.smallBannerPhotoURL = json[CodingKeys.smallBannerPhotoURL.stringValue].string
        self.smallPhotoURL = json[CodingKeys.smallPhotoURL.stringValue].string
        self.state = json[CodingKeys.state.stringValue].string
        self.stayInTouchNote = json[CodingKeys.stayInTouchNote.stringValue].string
        self.stayInTouchSignature = json[CodingKeys.stayInTouchSignature.stringValue].string
        self.stayInTouchSubject = json[CodingKeys.stayInTouchSubject.stringValue].string
        self.street = json[CodingKeys.street.stringValue].string
        self.suffix = json[CodingKeys.suffix.stringValue].string
        self.systemModstamp = json[CodingKeys.systemModstamp.stringValue].string
        self.timeZoneSidKey = json[CodingKeys.timeZoneSidKey.stringValue].string
        self.title = json[CodingKeys.title.stringValue].string
        self.username = json[CodingKeys.username.stringValue].string
        self.userRoleID = json[CodingKeys.userRoleID.stringValue].string
        self.userType = json[CodingKeys.userType.stringValue].string
        return self
    }
}
