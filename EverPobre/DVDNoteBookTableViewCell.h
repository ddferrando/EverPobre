//
//  DVDNoteTableViewCell.h
//  EverPobre
//
//  Created by david martínez ferrando on 4/2/15.
//  Copyright (c) 2015 david martínez ferrando. All rights reserved.
//

@import UIKit;

@interface DVDNoteBookTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *imgBackGround;

@property (weak, nonatomic) IBOutlet UILabel *numNotes;

@property (weak, nonatomic) IBOutlet UILabel *title;

@property (weak, nonatomic) IBOutlet UILabel *creationDate;

@property (weak, nonatomic) IBOutlet UILabel *modificationDate;

+(NSString *) cellId;

+(CGFloat) cellHeight;

-(id) init;

@end
