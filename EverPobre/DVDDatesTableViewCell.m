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
    
    //[self syncNoteWithView];
    //observem les propietatsde la nota
    //i actualitzem la data del modification date
    [self.note addObserver:self
                forKeyPath:DVDNoteAttributes.modificationDate
                   options:0
                   context:NULL];
    //sincronitzem el nou valor de modificationDate
    //[self syncNoteWithView];
}

#pragma mark - Class Methods
+(NSString *) cellId{
    return [self description];
}

+(CGFloat) cellHeight{
    return 45.0f;
}

#pragma mark - KVO
-(void) prepareForReuse{
    
    [super prepareForReuse];
    
    [self.note removeObserver:self
                   forKeyPath:DVDNoteAttributes.modificationDate];
}

-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    
    //sincronitzem el nou valor de modificationDate
    [self syncNoteWithView];
}

-(void)syncNoteWithView{
//    NSDateFormatter *fmtDay = [NSDateFormatter new];
//    fmtDay.dateStyle = NSDateFormatterShortStyle;
//    NSDateFormatter *fmtTime = [NSDateFormatter new];
//   // fmtTime.timeStyle = NSDateFormatterLongStyle;
//   // [fmtTime setDateFormat:@"hh:mm:ss:mm"];
//    [fmtTime setDateFormat:@"HH:mm:ss"];
//    
//    NSString *creationDate = [fmtDay stringFromDate:self.note.creationDate];
//    NSString *creationTime = [fmtTime stringFromDate:self.note.creationDate];
    
    
    self.creationDate.text = [NSString stringWithFormat:@"Creat el dia: %@ a les %@",
                              [[self formatedDateWithDate:self.note.creationDate] objectAtIndex:0],
                              [[self formatedDateWithDate:self.note.creationDate] lastObject]];
                               
    
    
    self.modificationDate.text = [NSString stringWithFormat:@"Modificat el dia: %@ a les %@",
                                  [[self formatedDateWithDate:self.note.modificationDate] objectAtIndex:0],
                                  [[self formatedDateWithDate:self.note.modificationDate] lastObject]];
}

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

-(NSArray *) formatedDateWithDate:(NSDate *) date {
    
    NSDateFormatter *fmtDay = [NSDateFormatter new];
    fmtDay.dateStyle = NSDateFormatterShortStyle;
    NSDateFormatter *fmtTime = [NSDateFormatter new];
    // fmtTime.timeStyle = NSDateFormatterLongStyle;
    // [fmtTime setDateFormat:@"hh:mm:ss:mm"];
    [fmtTime setDateFormat:@"HH:mm:ss"];
    
    NSString *dateFormat = [fmtDay stringFromDate:date];
    NSString *timeFormat = [fmtTime stringFromDate:date];
    
    
    return @[dateFormat, timeFormat];
    
}

@end
