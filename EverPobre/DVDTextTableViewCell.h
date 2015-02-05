//
//  DVDTextTableViewCell.h
//  EverPobre
//
//  Created by david martínez ferrando on 5/2/15.
//  Copyright (c) 2015 david martínez ferrando. All rights reserved.
//

@import UIKit;
@class DVDNote;

@interface DVDTextTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *textView;

@property (strong, nonatomic) DVDNote *note;

+(NSString *) cellId;

+(CGFloat) cellHeight;
@end
