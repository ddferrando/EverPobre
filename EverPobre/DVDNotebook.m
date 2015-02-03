#import "DVDNotebook.h"

@interface DVDNotebook ()

// Private interface goes here.

@end

@implementation DVDNotebook

// Custom logic goes here.

+(instancetype) noteBookWithName:(NSString *) name
                         context:(NSManagedObjectContext *) context{
    
    DVDNotebook *noteBook = [self insertInManagedObjectContext:context];
    
    noteBook.name = name;
    noteBook.creationDate = [NSDate date];
    noteBook.modificationDate = [NSDate date];
    
    
    return noteBook;
}

#pragma mark - lifeCycle
//info: amb mogenerator fem que les classes màquines heredin de la meva classe (que alhora ereda de NSManagedObject) i així posar codi comú i utilitats que ens serveixin per totes les clases i no haver de repetir codi
//implementats en el DVDMyManagedObject els mètodes [awakeFromInsert, awakeFromFetch, willTurnIntoFault{]


#pragma mark - Utils
-(NSArray *) obsevableKeys{
    return @[DVDNotebookAttributes.name,
             DVDNotebookRelationships.notes];
}

#pragma mark - KVO
-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    
    //aquí només ens interessa saebr que alguna cosa ha canviat
    self.modificationDate = [NSDate date];
}

@end
