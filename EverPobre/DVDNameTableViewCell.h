//
//  DVDNameTableViewCell.h
//  EverPobre
//
//  Created by david martínez ferrando on 5/2/15.
//  Copyright (c) 2015 david martínez ferrando. All rights reserved.
//

@import UIKit;

@class DVDNote;


@interface DVDNameTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UITextField *nameField;
@property (strong, nonatomic) DVDNote *note;

+(NSString *) cellId;
+(CGFloat) cellHeight;


@end
