//
//  DVDNameTableViewCell.m
//  EverPobre
//
//  Created by david martínez ferrando on 5/2/15.
//  Copyright (c) 2015 david martínez ferrando. All rights reserved.
//

#import "DVDNameTableViewCell.h"
#import "DVDNote.h"
#import "DVDNoteViewController.h"

@interface DVDNameTableViewCell  ()


@end

@implementation DVDNameTableViewCell

#pragma mark - Properties
-(void) setNote:(DVDNote *)note{
    _note = note;
    
    self.nameField.text = note.name;
}


#pragma mark - Class Methods
+(NSString *) cellId{
    return [self description];
}

+(CGFloat) cellHeight{
    return 44.0f;
}


#pragma mark - UITextFieldDelegate
-(BOOL) textFieldShouldReturn:(UITextField *)textField{
    if ([self.nameField.text length] == 0) {
       
        
        NSLog(@"Aquí hem de mostrar l'alerta si no ha introduït cap text en  el camp del nom --> DVDNameTableViewCell.m");
        [self showAlert];
        
    } else{
        return YES;
    }
    
    NSInteger nextTag = textField.tag + 1;
    // Try to find next responder
    UIResponder* nextResponder = [textField.superview viewWithTag:nextTag];
    if (nextResponder) {
        // Found next responder, so set it.
        [nextResponder becomeFirstResponder];
    } else {
        // Not found, so remove keyboard.
        [textField resignFirstResponder];
    }
    return YES;
}

#pragma mark - MISCELÀNIA
-(void) prepareForReuse{
    [super prepareForReuse];
    
    //aquí es un bon moment per resetejar la taula (donar-la de baixa del KVO)
    //Això vol dir donar-se de baixa del KVO per tornar a estar disponible
    //Ens donem de baixa de les notificacions KVO
    

    self.note.name = self.nameField.text;

}


- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}




-(void) showAlert{
    NSLog(@"No has escrit res!");
    
    //configurem lalert view
//    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"Text necessari"
//                                                                   message:@"El camp del nom és obligatori" preferredStyle:UIAlertControllerStyleAlert];
//    
//    UIAlertAction* ok = [UIAlertAction actionWithTitle:@"OK"
//                                                 style:UIAlertActionStyleDefault
//                                               handler:^(UIAlertAction * action) {
//                                                   //Do some thing here
//                                                   [alert dismissViewControllerAnimated:YES completion:nil];
//                                                   
//                                               }];
//    UIAlertAction *cancel = [UIAlertAction actionWithTitle:@"Cancelar"
//                                                     style:UIAlertActionStyleDefault
//                                                   handler:^(UIAlertAction *action) {
//                                                       [alert dismissViewControllerAnimated:YES completion:nil];
//                                                   }];
//    [alert addAction:ok]; // add action to uialertcontroller
//    [alert addAction:cancel];

    //    //mostrem l'alerta
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Falta el nom"
                                                    message:@"Has d'introduïr un nom"
                                                   delegate:self
                                          cancelButtonTitle:@"Ok"
                                          otherButtonTitles:nil, nil];
    
    [alert show];
    
//   [self presentViewController:alert animated:YES completion:nil];
}


@end
