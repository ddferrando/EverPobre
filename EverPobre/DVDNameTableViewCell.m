//
//  DVDNameTableViewCell.m
//  EverPobre
//
//  Created by david martínez ferrando on 5/2/15.
//  Copyright (c) 2015 david martínez ferrando. All rights reserved.
//

#import "DVDNameTableViewCell.h"
#import "DVDNote.h"

@interface DVDNameTableViewCell  ()


@end

@implementation DVDNameTableViewCell

#pragma mark - Properties
-(void) setNote:(DVDNote *)note{
    _note = note;
}


#pragma mark - Class Methods
+(NSString *) cellId{
    return [self description];
}

+(CGFloat) cellHeight{
    return 44.0f;
}


#pragma mark - MISCELÀNIA
-(void) prepareForReuse{
    [super prepareForReuse];
    
    //aquí es un bon moment per resetejar la taula (donar-la de baixa del KVO)
    //Això vol dir donar-se de baixa del KVO per tornar a estar disponible
    //Ens donem de baixa de les notificacions KVO
    
#warning - Implementar la comprovació de que ha escrit alguna cosa al textFielsen el seu delegat 
    
    self.note.name = self.nameField.text;
}





- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
