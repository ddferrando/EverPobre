//
//  DVDNoteTableViewCell.m
//  EverPobre
//
//  Created by david martínez ferrando on 4/2/15.
//  Copyright (c) 2015 david martínez ferrando. All rights reserved.
//

#import "DVDNoteTableViewCell.h"

@implementation DVDNoteTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(NSString *) cellId{
    return NSStringFromClass(self);
}

+(CGFloat) cellHeight{
    return 120.0f;
}


//metode designat
-(id) init{
    if( self = [super init]){
        
        
    }
    return self;
}
@end
