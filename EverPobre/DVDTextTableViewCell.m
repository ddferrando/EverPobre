//
//  DVDTextTableViewCell.m
//  EverPobre
//
//  Created by david martínez ferrando on 5/2/15.
//  Copyright (c) 2015 david martínez ferrando. All rights reserved.
//

#import "DVDTextTableViewCell.h"
#import "DVDNote.h"

@implementation DVDTextTableViewCell


#pragma mark - Properties
-(void) setNote:(DVDNote *)note{
    
    //desem la nota
    _note = note;
    
    //la mostrem en la vista
    self.textView.text = self.note.text;
}

#pragma mark - Class Methods
+(NSString *) cellId{
    return [self description];
}

+(CGFloat) cellHeight{
    return 320.0f;
}


#pragma mark - MISCELÀNIA

//s'amaga la cel·la
-(void) prepareForReuse{
    [super prepareForReuse];
    
    //desem les modificacions
    self.note.text = self.textView.text;
    
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
