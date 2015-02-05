//
//  DVDNoteViewController.h
//  EverPobre
//
//  Created by david martínez ferrando on 5/2/15.
//  Copyright (c) 2015 david martínez ferrando. All rights reserved.
//

#import <UIKit/UIKit.h>
@class DVDNote;

@interface DVDNoteViewController : UITableViewController


@property (strong, nonatomic) DVDNote *note;

//inicializador designat
-(id) initWithModel:(DVDNote *) aModel;


@end
