//
//  DVDNotesViewController.m
//  EverPobre
//
//  Created by david martínez ferrando on 4/2/15.
//  Copyright (c) 2015 david martínez ferrando. All rights reserved.
//


#import "DVDNotesViewController.h"
#import "DVDNote.h"
#import "DVDPhotoContainer.h"
#import "DVDNotebook.h"

@implementation DVDNotesViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    //self.title = @"Everpobre";
    
    //afegim un boto
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                 target:self
                                                                                 action:@selector(addNote:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
}
                  
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    //en quina llibreta estem
    
    self.title = self.noteBook.name;
}

#pragma mark - TabelViewDelegates
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Esbrinem de quina llibreria ens  parlen
    DVDNote *note =[self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //ReuseId  --> definim la cel·la per poder-la reutilitzar
    static NSString *cellId = @"NoteBookCell";
    
    //creem una cel·la
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        //hem de crear la cel·la a pèl
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    
    //sincronitzem la cel·la i el model
    
    cell.textLabel.text = note.name;
    
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterShortStyle;
    cell.imageView.image = note.photo.image;
    cell.textLabel.text = note.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ ",
                                 [fmt stringFromDate:note.modificationDate]];
    
    //retornem la cel·la configurada amb les vistes i el model
    return cell;
}


//Permetre l'eliminació
-(void) tableView:(UITableView *)tableView
commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
forRowAtIndexPath:(NSIndexPath *)indexPath{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        
        //Borrem la llibreta. Primer recuperem el context i
        NSManagedObjectContext *cntx = self.fetchedResultsController.managedObjectContext;
        
        //recuperem la llibreta que volem eliminar
        DVDNotebook *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
        
        //assignem el delega
        
        
        //Eliminem la llibreta
        [cntx deleteObject:nb];
    }
}

-(NSString *) tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath{
    return @"Elimina nota";
}

#pragma mark - actions

-(void) addNote:(id) sender {
    
    //recuperem la llibreta en la que crearem la nota
    //DVDNotebook *nb = [self.fetchedResultsController.managedObjectContext ob];
    
    //creem una llibreta
    [DVDNote noteWithName:@"Nota nova"
                 notebook:self.noteBook
                  context:self.fetchedResultsController.managedObjectContext];
}

@end
