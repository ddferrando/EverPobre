//
//  DVDNoteViewController.m
//  EverPobre
//
//  Created by david martínez ferrando on 5/2/15.
//  Copyright (c) 2015 david martínez ferrando. All rights reserved.
//

//constants
#define NUMBER_OF_SECTIONS 4
#define NAME_SECCTION_HEADER @"Nom"
#define DATES_SECTION_HEADER @"Creació i última modificació"
#define TEXT_SECTION_HEADER @"Text"
#define PHOTO_SECCTION_HEADER @"Foto"

#define NAME_SECCTION 0
#define DATES_SECTION 1
#define TEXT_SECTION 2
#define PHOTO_SECCTION 3

#import "DVDNoteViewController.h"
#import "DVDNote.h"
#import "DVDNameTableViewCell.h"
#import "DVDDatesTableViewCell.h"
#import "DVDTextTableViewCell.h"
#import "DVDPhotoTableViewCell.h"
#import "DVDPhotoViewController.h"


@interface DVDNoteViewController ()

@end

@implementation DVDNoteViewController

-(id) initWithModel:(DVDNote *) aModel{
    if(self =[super initWithNibName:nil bundle:nil]){
        _note = aModel;
    }
    
    return self;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = self.note.name;
   //registrem les vistes de les cel·les
    [self registerNibs];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    // Return the number of sections.
    return NUMBER_OF_SECTIONS;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    // Return the number of rows in the section.
    return 1;
}

-(NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    
    switch (section) {
        case NAME_SECCTION:
            return  NAME_SECCTION_HEADER;
            break;
        case DATES_SECTION:
            return  DATES_SECTION_HEADER;
            break;
        case TEXT_SECTION:
            return  TEXT_SECTION_HEADER;
            break;
        case PHOTO_SECCTION:
            return  PHOTO_SECCTION_HEADER;
            break;
            
        default:
            [NSException raise:@"Aquesta secció no existeix"
                        format:nil];
            return @"No existeix aquesta secció";
            break;
    }
    
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    switch (indexPath.section) {
        case NAME_SECCTION:{
            return [DVDNameTableViewCell cellHeight];
            break;
        }
        
        case TEXT_SECTION:{
            return [DVDTextTableViewCell cellHeight];
            break;
        }
        case DATES_SECTION:{
            return [DVDDatesTableViewCell cellHeight];
            break;
        }
        case PHOTO_SECCTION:{
            return [DVDPhotoTableViewCell cellHeight];
            break;
        }
        default:
            return 44;
            break;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    
    //Esbrinem de quina cel·la ens parla
    
    switch (indexPath.section) {
        case NAME_SECCTION:{
            DVDNameTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DVDNameTableViewCell cellId] forIndexPath:indexPath];
            
            [cell setNote:self.note];
            return cell;
            break;
        }
        case TEXT_SECTION:{
            
            DVDTextTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DVDTextTableViewCell cellId] forIndexPath:indexPath];
            
            [cell setNote:self.note];
            return cell;
            break;
        }
            
        case DATES_SECTION:{
            DVDDatesTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DVDDatesTableViewCell cellId] forIndexPath:indexPath];
            
                [cell setNote:self.note];
                return cell;
            
            break;
        }
        case PHOTO_SECCTION:{
            DVDPhotoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DVDPhotoTableViewCell cellId] forIndexPath:indexPath];
            
            [cell setNote:self.note];
            return cell;
        }
            break;
        default:
            [NSException raise:@"Secció desconeguda "
                        format:@"Secció desconeguda %ld", indexPath.section];
            return nil;
            break;
    }
    
    //refresquem la info
    [self.tableView beginUpdates];
    [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
    [self.tableView endUpdates];
}



#pragma mark - Utils
-(void) registerNibs{
    NSBundle *mainBundle =[NSBundle mainBundle];
    
    //registrem la cel·la
    //cel·la nom
    UINib *nameNib = [UINib nibWithNibName:@"DVDNameTableViewCell" bundle:mainBundle];
    [self.tableView registerNib:nameNib forCellReuseIdentifier:[DVDNameTableViewCell cellId]];
    
    //cel·la text
    UINib *textNib = [UINib nibWithNibName:@"DVDTextTableViewCell" bundle:mainBundle];
    [self.tableView registerNib:textNib forCellReuseIdentifier:[DVDTextTableViewCell cellId]];
    
    //cel·la dates
    UINib *datesNib = [UINib nibWithNibName:@"DVDDatesTableViewCell" bundle:mainBundle];
    [self.tableView registerNib:datesNib forCellReuseIdentifier:[DVDDatesTableViewCell cellId]];
    
    //cel·la foto
    UINib *photoNib = [UINib nibWithNibName:@"DVDPhotoTableViewCell" bundle:mainBundle];
    [self.tableView registerNib:photoNib forCellReuseIdentifier:[DVDPhotoTableViewCell cellId]];
    
}

-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //si cliquem a la photo fem el push del container
    if (indexPath.section  == PHOTO_SECCTION) {
        
        DVDPhotoViewController * pVC = [[DVDPhotoViewController alloc] initWithModel:self.note];
        [self.navigationController pushViewController:pVC animated:YES];
    }
}




@end
