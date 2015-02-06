//
//  DVDPhotoViewController.m
//  EverPobre
//
//  Created by david martínez ferrando on 5/2/15.
//  Copyright (c) 2015 david martínez ferrando. All rights reserved.
//

#import "DVDPhotoViewController.h"
#import "DVDNote.h"
#import "DVDPhotoContainer.h"

@interface DVDPhotoViewController ()

@property (strong, nonatomic) DVDNote *model;
@end

@implementation DVDPhotoViewController

- (IBAction)deletePhoto:(id)sender {
}

- (IBAction)takePhoto:(id)sender {
}

-(id) initWithModel:(DVDNote*) model{
    if(self = [super initWithNibName:nil bundle:nil]){
        _model = model;
    }
    return self;
}

-(void) viewWillAppear:(BOOL)animated{
    
    [super viewWillAppear:animated];
    
    self.photoView.image = self.model.photo.image;
}

-(void) viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    if (self.photoView.image) {
        
        self.model.photo.image = self.photoView.image;
    }
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
