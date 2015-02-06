//
//  DVDNoteViewController.h
//  EverPobre
//
//  Created by david martínez ferrando on 5/2/15.
//  Copyright (c) 2015 david martínez ferrando. All rights reserved.
//

@import UIKit;


@class DVDNote;

@interface DVDNoteViewController : UITableViewController<UIAlertViewDelegate>


@property (strong, nonatomic) DVDNote *note;

//inicializador designat
-(id) initWithModel:(DVDNote *) aModel;


@end
