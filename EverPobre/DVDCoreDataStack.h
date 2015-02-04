//
//  AGTCoreDataStack.h
//
//  Created by Fernando Rodríguez Romero on 1/24/13.
//  Copyright (c) 2013 Agbo. All rights reserved.
//

@import Foundation;
@import CoreData;

@class NSManagedObjectContext;

@interface DVDCoreDataStack : NSObject

@property (strong, nonatomic, readonly) NSManagedObjectContext *context;

+(NSString *) persistentStoreCoordinatorErrorNotificationName;

+(DVDCoreDataStack *) coreDataStackWithModelName:(NSString *)aModelName
                               databaseFilename:(NSString*) aDBName;

+(DVDCoreDataStack *) coreDataStackWithModelName:(NSString *)aModelName;

+(DVDCoreDataStack *) coreDataStackWithModelName:(NSString *)aModelName
                                    databaseURL:(NSURL*) aDBURL;

//inicialitzador
-(id) initWithModelName:(NSString *)aModelName
            databaseURL:(NSURL*) aDBURL;

//elimina tots els registres
-(void) zapAllData;

//tant la cerca com el desat pot generar un error
-(void) saveWithErrorBlock: (void(^)(NSError *error))errorBlock;
-(NSArray *) executeFetchRequest:(NSFetchRequest *)req errorBlock:(void(^)(NSError *error))errorBlock;
@end
