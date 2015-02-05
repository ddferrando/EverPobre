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
#import "DVDNoteTableViewCell.h"
#import "DVDNoteViewController.h"
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



-(void) viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    
    //registrem la cel·la
    UINib *nbNib = [UINib nibWithNibName:@"DVDNoteTableViewCell" bundle:nil];
    [self.tableView registerNib:nbNib forCellReuseIdentifier:[DVDNoteTableViewCell cellId]];
    
    
    //eliminem les línies de separació
    self.tableView.separatorStyle  = UITableViewCellSeparatorStyleNone;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


//Fent servir les classes del Fernando aquest és l´únic métode que hem d'implementar la resta la tenim implementada en el moment que instanciem aquesta classe (en l'AppDelegat en aquest cas) 
#pragma mark - TabelViewDelegates
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return
    self.tableView.rowHeight=[DVDNoteTableViewCell cellHeight];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    //Esbrinem de quina llibreria ens  parlen
    DVDNotebook *nb =[self.fetchedResultsController objectAtIndexPath:indexPath];
    

    //creem la cel·la personalitzada
    DVDNoteTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:[DVDNoteTableViewCell cellId]];
    
    
    //sincronitzem la cel·la i el model
    cell.title.text = nb.name;
    cell.numNotes.text=[NSString stringWithFormat:@"Nombre de notes: %lu",[nb.notes count]];
    
    NSDateFormatter *fmt = [NSDateFormatter new];
    fmt.dateStyle = NSDateFormatterShortStyle;
    cell.modificationDate.text = [NSString stringWithFormat:@"Modificada: %@ ",
                                 [fmt stringFromDate:nb.modificationDate]];
                                  
    cell.creationDate.text = [NSString stringWithFormat:@"Creada: %@ ",
                              [fmt stringFromDate:nb.modificationDate]];
    
    //retornem la cel·la configurada amb les vistes i el model
    return cell;
}

//Permetre l'eliminació
-(void) tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle) editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath{
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

    //recuperem les notes
    DVDNotesViewController * nVC = [[DVDNotesViewController alloc] initWithFetchedResultsController:fc style:UITableViewStylePlain];
    
    //l'assignem
    [nVC setNoteBook:nb];
    
    
    //li fem el push
    [self.navigationController pushViewController:nVC animated:YES];
}




#pragma mark - actions
-(void) addNoteBook:(id) sender {
    //
    
    
    // *** opció 1
    //aquí afegim la llibreta fent un push al navigation i mostrant el ViewController (que és una taula) del detall de la llibreta
    
    
    //NSArray *arr = @[@"Nom", @"img"];
    //creem el ViewController del detall de la Llibreta passant-li el fetchRequest
    //DVDNoteBookDetailViewController *nbDetailVC = [[DVDNoteBookDetailViewController alloc] initWithArray:arr];
    
    //fem el push
    /*[self.navigationController pushViewController:nbDetailVC animated:YES];
    
    
    nbDetailVC.nb = arr;
     */
    
    
    // **** opció 2
    //aquí afegim la nova llibreta directament a la taula
    
    
    //- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
    int numNb = (int)[self.tableView numberOfRowsInSection:0] + 1;
    
    //DVDNotebook *nb = [self.fetchedResultsController objectAtIndexPath:indexPath];
    NSString *nameNB = [NSString stringWithFormat:@"Llibreta %lu", (unsigned long)numNb];
    
    [DVDNotebook noteBookWithName:nameNB context:self.fetchedResultsController.managedObjectContext];
     
    
    // *** opció 3
    
    //iniciem el
    //DVDNoteViewController *nbVC = [[DVDNoteViewController alloc] initWithModel:<#(DVDNote *)#>];
    
    //fem el push
    //[self.navigationController pushViewController:nbDetailVC animated:YES];
    
    
}



@end
