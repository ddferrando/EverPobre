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


#pragma mark - Lifecycle
-(void) awakeFromInsert{
    [super awakeFromInsert];
    
    [self setUpKVO];
}

-(void) awakeFromFetch{
    [super awakeFromFetch];
    
    [self setUpKVO];
}
    
-(void) willTurnIntoFault{
    [super willTurnIntoFault];
    
    [self tearDownKVO];
}


#pragma mark - Utils
-(NSArray *) obsevableKeys{
    return @[DVDNotebookAttributes.name, DVDNotebookRelationships.notes];
}

#pragma mark - KVO
-(void) setUpKVO{
    //ens donem d'alta en el KVO per enviar el missatge que volguem
    
    for (NSString *key in [self obsevableKeys]){
    [self addObserver:self
           forKeyPath:key
              options:NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
              context:NULL];
    }
}

-(void) tearDownKVO{
    //ens donem de baixa de KVO - totes les lliste d'spam 
    
    for (NSString *key in [self obsevableKeys]){
        [self removeObserver:self
                  forKeyPath:key];
    }
}

-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    
    //aquí només ens interessa saebr que alguna cosa ha canviat
    self.modificationDate = [NSDate date];
    
}









@end
