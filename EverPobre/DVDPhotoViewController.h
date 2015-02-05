//
//  DVDPhotoViewController.h
//  EverPobre
//
//  Created by david martínez ferrando on 5/2/15.
//  Copyright (c) 2015 david martínez ferrando. All rights reserved.
//

@import UIKit;
@class DVDNote;

@interface DVDPhotoViewController : UIViewController


@property (weak, nonatomic) IBOutlet UIImageView *photoView;
- (IBAction)deletePhoto:(id)sender;
- (IBAction)takePhoto:(id)sender;

-(id) initWithModel:(DVDNote*) model;
@end
