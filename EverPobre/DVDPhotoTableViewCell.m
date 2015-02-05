//
//  DVDPhotoTableViewCell.m
//  EverPobre
//
//  Created by david martínez ferrando on 5/2/15.
//  Copyright (c) 2015 david martínez ferrando. All rights reserved.
//

#import "DVDPhotoTableViewCell.h"
#import "DVDNote.h"
#import "DVDPhotoContainer.h"

@implementation DVDPhotoTableViewCell


#pragma mark - Properties 
//setter personalitzat
-(void) setNote:(DVDNote *)note{
    //desem la nota
    _note = note;
    
    //sincronitzem la photo amb les dades la nota
    self.photoFrame.image = note.photo.image;
}


#pragma mark - Class Methods
+(NSString *) cellId{
    return [self description];
}

+(CGFloat) cellHeight{
    return 320.0f;
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
