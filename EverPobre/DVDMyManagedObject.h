//
//  DVDMyManagedObject.h
//  EverPobre
//
//  Created by david martínez ferrando on 2/2/15.
//  Copyright (c) 2015 david martínez ferrando. All rights reserved.
//

@import CoreData;

@interface DVDMyManagedObject : NSManagedObject

-(NSArray *) obsevableKeys;
-(void) awakeFromInsert;
-(void) awakeFromFetch;

@end
