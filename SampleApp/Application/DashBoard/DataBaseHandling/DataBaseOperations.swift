//
//  DataBaseOperations.swift
//  SampleApp
//
//  Created by Atinder Kaur on 2021-04-19.
//

import Foundation
import UIKit
import CoreData

class DataBaseOperations : NSObject
{
    //Variables
    static let appDelegate = UIApplication.shared.delegate as! AppDelegate
    static let managedContext = appDelegate.persistentContainer.viewContext

    class func saveVehicleIndatabase(strData : Data,success: @escaping (String) -> Void, failure: @escaping (String) -> Void)
    {
        let entity =  NSEntityDescription.entity(forEntityName: localDataBaseVariable.vehicleList,
                                                 in:managedContext)
        let objContext = NSManagedObject(entity: entity!,
                                     insertInto: managedContext)
        //Save data in Database
      do {
          objContext.setValue(strData, forKeyPath: localDataBaseVariable.attributeData)
            do {
                try self.managedContext.save()
                success(kDatabaseSuccess)
            } catch let error as NSError  {
                print("Could not save \(error), \(error.userInfo)")
            }
        }
    }
    
    //MARK: Get Offline data
    class func getOfflineData(success: @escaping (ResponseData) -> Void, failure: @escaping (String) -> Void)
       {
          
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: localDataBaseVariable.vehicleList)
        do {
            let results =
                try managedContext.fetch(fetchRequest)
            if results.count != 0 {
                for result in results {
                    print(result)
                    let singleObj = result as? NSManagedObject
                    let localData = singleObj?.value(forKey: localDataBaseVariable.attributeData) as! Data
                    do {
                        let localList = try JSONDecoder().decode(ResponseData.self, from: localData)
                        success(localList)
                    }
                    catch let error as NSError {
                        print("Could not fetch \(error), \(error.userInfo)")
                        let errorStr = ("\(kDatabaseFailure) \(error), \(error.userInfo)")
                        failure(errorStr)
                    }
                }
            }
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
            let errorStr = ("\(kDatabaseFailure) \(error), \(error.userInfo)")
            failure(errorStr)
        }
       }
    
   class func someEntityExists() -> Bool {
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: localDataBaseVariable.vehicleList)
    do {
        let results =
            try managedContext.fetch(fetchRequest)
        if results.count > 0 {
            return true
        }
        else{
            return false
        }
        }
        catch {
            print("error executing fetch request: \(error)")
            return false
        }
    }
}
