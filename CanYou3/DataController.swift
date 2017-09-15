//
//  DataController.swift
//  CanYou3
//
//  Created by Mac Pro on 2017. 9. 13..
//  Copyright © 2017년 Eric.Park. All rights reserved.
//

import UIKit
import CoreData

class DataController: NSObject {
    var currentUser: User!
    
    var managedObjectContext: NSManagedObjectContext
    
    // MARK: - Initializer
    //    init(completionClosure: @escaping () -> ()) {
    override init() {
        //This resource is the same name as your xcdatamodeld contained in your project
        guard let modelURL = Bundle.main.url(forResource: CoreDataName.mainModel, withExtension:"momd") else {
            fatalError("Error loading model from bundle")
        }
        // The managed object model for the application. It is a fatal error for the application not to be able to find and load its model.
        guard let mom = NSManagedObjectModel(contentsOf: modelURL) else {
            fatalError("Error initializing mom from: \(modelURL)")
        }
        
        let psc = NSPersistentStoreCoordinator(managedObjectModel: mom)
        
        // use Main Queue
        managedObjectContext = NSManagedObjectContext(concurrencyType: NSManagedObjectContextConcurrencyType.mainQueueConcurrencyType)
        managedObjectContext.persistentStoreCoordinator = psc
        
        //        let queue = DispatchQueue.global(qos: DispatchQoS.QoSClass.background)
        //        let queue = DispatchQueue.main
        //        queue.sync {
        guard let docURL = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last else {
            fatalError("Unable to resolve document directory")
        }
        let storeURL = docURL.appendingPathComponent("\(CoreDataName.sqliteFile).sqlite")
        do {
            try psc.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: storeURL, options: nil)
            //The callback block is expected to complete the User Interface and therefore should be presented back on the main queue so that the user interface does not need to be concerned with which queue this call is coming from.
            //                DispatchQueue.main.sync(execute: completionClosure)
        } catch {
            fatalError("Error migrating store: \(error)")
        }
        //        }
    }
    
    // Init CurrentUser
    func setCurrentUser() {
        let queue = DispatchQueue.global(qos: DispatchQoS.QoSClass.background)
        queue.async {
            
            let fetchedElements = self.fetchUsers()
            
            if let existingElement = fetchedElements?.first {
                self.currentUser = existingElement
            } else {
                let element = self.newUser()
                element.startDate = NSDate()
                element.birthDate = NSDate()
                
                self.saveContext()
                
                self.currentUser = element
            }
        }
    }
    
    // Init Data
    func initData() {
        // Init HealthInfo
        for e in InitialData.healthInfos{
            HealthInfoStore.createItem(name: e.name, time: e.time, content: e.content)
        }
        
        // Init Badges
        for e in InitialData.badges{
            BadgeStore.createItem(user: self.currentUser, name: e.name, imageName: e.imageName, content: e.content, conditionType: e.conditionType, conditionValue: e.conditionValue)
        }
    }
    
    // Init HealthInfos
    func initHealthInfos() {
        //        HealthInfoStore.createItem(name: "혈압, 맥박, 손과 발의 체온이 정상으로 돌아옴", time: 1200, content: "20분")
        //        HealthInfoStore.createItem(name: "혈중 니코틴 농도가 낮아지기 시작함", time: 7200, content: "2시간")
        //        HealthInfoStore.createItem(name: "혈중 니코틴 수치가 6.2%로 거의 사라짐", time: 28800, content: "8시간")
        //        HealthInfoStore.createItem(name: "혈중 산소량과 일산화 탄소양이 정상으로 돌아옴", time: 43200, content: "12시간")
        //        HealthInfoStore.createItem(name: "일산화 탄소가 배출됨", time: 64800, content: "18시간")
        //        HealthInfoStore.createItem(name: "후각과 미각이 정상으로 돌아오기 시작", time: 172800, content: "48시간")
        //        HealthInfoStore.createItem(name: "니코틴이 완전히 사라짐, 폐 기능 향상", time: 259200, content: "72시간")
        //        HealthInfoStore.createItem(name: "진하던 가래가 묽어짐", time: 604800, content: "1주")
        //        HealthInfoStore.createItem(name: "중독 증세가 괴롭지 않은 지점에 도달", time: 1209600, content: "2주")
        //        HealthInfoStore.createItem(name: "니코틴 수용체 감소로 비흡연자와 비슷한 수준에 도달", time: 1814400, content: "3주")
        //        HealthInfoStore.createItem(name: "금단 현상 종료, 인슐린 저항성이 정상으로 돌아옴", time: 2592000, content: "1달")
        //        HealthInfoStore.createItem(name: "혈액순환이 좋아지고 폐 기능이 30% 향상", time: 5184000, content: "2달")
        //        HealthInfoStore.createItem(name: "순환기능 향상, 심장마비가 올 확률 감소", time: 7776000, content: "3달")
        //        HealthInfoStore.createItem(name: "폐의 섬모가 다시 자라남, 전체적인 체력 증가", time: 23328000, content: "9달")
        //        HealthInfoStore.createItem(name: "심혈관계통 질환이 비흡연자의 절반으로 감소", time: 31536000, content: "1년")
        //        HealthInfoStore.createItem(name: "흡연으로 폐에 쌓였던 가래가 완전히 제거됨", time: 63072000, content: "2년")
        //        HealthInfoStore.createItem(name: "뇌졸증에 걸릴 위험이 비흡연자와 같아짐", time: 157680000, content: "5년")
        //        HealthInfoStore.createItem(name: "흡연 관련 암 발병율이 흡연자의 절반으로 감소됨", time: 315360000, content: "10년")
        //        HealthInfoStore.createItem(name: "심혈관계통 질환에 걸릴 위험이 비흡연자와 같아짐", time: 473040000, content: "15년")
    }
    
    // Init Badges
    func initBadges() {
        //        BadgeStore.createItem(user: currentUser, name: "24hours", imageName: "badge-24hours", content: "Good start !", conditionType: .time, conditionValue: 86400)
        //        BadgeStore.createItem(user: currentUser, name: "48hours", imageName: "badge-48hours", content: "Nice", conditionType: .time, conditionValue: 172800)
        //        BadgeStore.createItem(user: currentUser, name: "72hours", imageName: "badge-72hours", content: "Keep it up !", conditionType: .time, conditionValue: 259200)
        //        BadgeStore.createItem(user: currentUser, name: "A Week", imageName: "badge-7days", content: "Getting better", conditionType: .time, conditionValue: 604800)
        //        BadgeStore.createItem(user: currentUser, name: "Money saved", imageName: "badge-10000won", content: "10,000 won saved!", conditionType: .money, conditionValue: 10000)
        //        BadgeStore.createItem(user: currentUser, name: "Money saved", imageName: "badge-moneysave", content: "100,000 won saved!", conditionType: .money, conditionValue: 100000)
        //        BadgeStore.createItem(user: currentUser, name: "First reward", imageName: "badge-1reward", content: "You got a reward", conditionType: .reward, conditionValue: 1)
    }
    
    // MARK: - Core Data Saving support
    func saveContext() {
        if self.managedObjectContext.hasChanges {
            self.managedObjectContext.performAndWait {
                do {
                    try self.managedObjectContext.save()
                } catch {
                    fatalError("Failure to save context: \(error)")
                }
            }
        }
    }
    
    // MARK: - Initiate Model support
    func newUser() -> User {
        let e = NSEntityDescription.insertNewObject(forEntityName: EntityName.user, into: managedObjectContext) as! User
        return e
    }
    
    func newHealthInfo() -> HealthInfo {
        let e = NSEntityDescription.insertNewObject(forEntityName: EntityName.healthInfo, into: managedObjectContext) as! HealthInfo
        return e
    }
    
    func newBadge() -> Badge {
        let e = NSEntityDescription.insertNewObject(forEntityName: EntityName.badge, into: managedObjectContext) as! Badge
        return e
    }
    
    func newReward() -> Reward {
        let e = NSEntityDescription.insertNewObject(forEntityName: EntityName.reward, into: managedObjectContext) as! Reward
        return e
    }
    
    // MARK: - Fetch data support
    
    func fetchUsers() -> [User]? {
        let fetchRequest: NSFetchRequest<User> = User.fetchRequest()
        
        var fetchedElements: [User]?
        self.managedObjectContext.performAndWait {
            fetchedElements = try? fetchRequest.execute()
        }
        
        return fetchedElements
    }
    
    
    func fetchHealthInfos() -> [HealthInfo]? {
        let fetchRequest: NSFetchRequest<HealthInfo> = HealthInfo.fetchRequest()
        
        var fetchedElements: [HealthInfo]?
        self.managedObjectContext.performAndWait {
            fetchedElements = try? fetchRequest.execute()
        }
        
        return fetchedElements
    }
    
}
