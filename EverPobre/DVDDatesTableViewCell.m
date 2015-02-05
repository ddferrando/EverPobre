//
//  DVDDatesTableViewCell.m
//  EverPobre
//
//  Created by david martínez ferrando on 5/2/15.
//  Copyright (c) 2015 david martínez ferrando. All rights reserved.
//

#import "DVDDatesTableViewCell.h"
#import "DVDNote.h"
@implementation DVDDatesTableViewCell

#pragma mark - Properties --> setter personalitzat
-(void) setNote:(DVDNote *)note{
    //desem la nota
    _note = note;
    
    //observem les propietatsde la nota
    //i actualitzem la data del modification date
    [self.note addObserver:self
                forKeyPath:DVDNoteAttributes.modificationDate
                   options:0
                   context:NULL];
}


#pragma mark - Class Methods
+(NSString *) cellId{
    return [self description];
}

+(CGFloat) cellHeight{
    return 44.0f;
}

#pragma mark - KVO
-(void) prepareForReuse{
    
    [super prepareForReuse];
    
    [self.note removeObserver:self
                   forKeyPath:DVDNoteAttributes.modificationDate];
}

-(void) addObserver:(NSObject *)observer
         forKeyPath:(NSString *)keyPath
            options:(NSKeyValueObservingOptions)options
            context:(void *)context{
    
    //sincronitzem el nou valor de modificationDate
    [self syncNoteWithView];
}

-(void)syncNoteWithView{
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterShortStyle;
    self.creationDate.text = [fmt stringFromDate:self.note.creationDate];
    
    self.modificationDate.text = [fmt stringFromDate:self.note.modificationDate];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
