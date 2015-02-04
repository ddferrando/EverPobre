//
//  DVDNoteBooksViewController.m
//  EverPobre
//
//  Created by david martínez ferrando on 4/2/15.
//  Copyright (c) 2015 david martínez ferrando. All rights reserved.
//

#import "DVDNoteBooksViewController.h"
#import "DVDNotebook.h"
#import "DVDNotesViewController.h"
#import "DVDNote.h"

@interface DVDNoteBooksViewController ()

@end

@implementation DVDNoteBooksViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.title = @"Everpobre";
    
    //afegim un boto
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                                 target:self
                                                                                 action:@selector(addNoteBook:)];
    self.navigationItem.rightBarButtonItem = rightButton;
    
   
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Fent servir les classes del Fernando aquest és l´únic métode que hem d'implementar la resta la tenim implementada en el moment que instanciem aquesta classe (en l'AppDelegat en aquest cas) 
#pragma mark - TabelViewDelegates
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Esbrinem de quina llibreria ens  parlen
    DVDNotebook *nb =[self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //ReuseId  --> definim la cel·la per poder-la reutilitzar
    static NSString *cellId = @"NoteBookCell";
    
    //creem una cel·la
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    if (cell == nil) {
        //hem de crear la cel·la a pèl
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellId];
    }
    
    //sincronitzem la cel·la i el model
    
    cell.textLabel.text = nb.name;
    
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterShortStyle;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%@ (%lu notes)",
                                 [fmt stringFromDate:nb.modificationDate],
                                 (unsigned long)nb.notes.count];
    
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
    return @"Elimina llibreta";
}


#pragma mark - Delegate
-(void) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    //esbrinem quina és la llibreta
    DVDNotebook *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    //Creem la selecció de dades
    NSFetchRequest *r = [NSFetchRequest fetchRequestWithEntityName:[DVDNote  entityName]];
    r.fetchBatchSize = 30;
    r.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:DVDNoteAttributes.name
                                                        ascending:YES
                                                         selector:@selector(caseInsensitiveCompare:)],
                          [NSSortDescriptor sortDescriptorWithKey:DVDNoteAttributes.modificationDate
                                                        ascending:NO]];
    
    r.predicate = [NSPredicate predicateWithFormat:@"notebook == %@", nb];
    
    NSFetchedResultsController *fc = [[NSFetchedResultsController alloc] initWithFetchRequest:r
                                                                         managedObjectContext:self.fetchedResultsController.managedObjectContext
                                                                           sectionNameKeyPath:nil
                                                                                    cacheName:nil];

    //Creem instancia del controlador de notes
    DVDNotesViewController * nVC = [[DVDNotesViewController alloc] initWithFetchedResultsController:fc
                                                                                              style:UITableViewStylePlain];
    
    
    [nVC setNoteBook:nb];
    
    //li fem el push
    [self.navigationController pushViewController:nVC animated:YES];
}


#pragma mark - actions

-(void) addNoteBook:(id) sender {
    
    //creem una llibreta
    
    [DVDNotebook noteBookWithName:@"Llibreta 2" context:self.fetchedResultsController.managedObjectContext];
}



@end
