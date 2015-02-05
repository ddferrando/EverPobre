//
//  DVDPhotoTableViewCell.h
//  EverPobre
//
//  Created by david martínez ferrando on 5/2/15.
//  Copyright (c) 2015 david martínez ferrando. All rights reserved.
//

@import UIKit;
#import "DVDNote.h"

@interface DVDPhotoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *photoFrame;

@property (strong, nonatomic) DVDNote *note;

+(NSString *) cellId;
+(CGFloat) cellHeight;


@end
