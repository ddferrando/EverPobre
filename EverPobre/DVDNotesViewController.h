//
//  DVDNotesViewController.h
//  EverPobre
//
//  Created by david martínez ferrando on 4/2/15.
//  Copyright (c) 2015 david martínez ferrando. All rights reserved.
//

#import "AGTCoreDataTableViewController.h"
#import "DVDNotebook.h"

@interface DVDNotesViewController : AGTCoreDataTableViewController

@property (strong, nonatomic) DVDNotebook *noteBook;

@end
