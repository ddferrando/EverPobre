#import "DVDNote.h"
#import "DVDPhotoContainer.h"

@interface DVDNote ()

// Private interface goes here.

@end

@implementation DVDNote

+(instancetype) noteWithName: (NSString *) name
                    notebook: (DVDNotebook *) notebook
                     context: (NSManagedObjectContext*) context{
    
    DVDNote *note = [self insertInManagedObjectContext:context];
    
    note.name = name;
    note.notebook = notebook;
    note.creationDate = [NSDate date];
    note.modificationDate = [NSDate date];
    note.photo = [DVDPhotoContainer insertInManagedObjectContext:context];
    
    return note;
}

#pragma mark - lifeCycle
//info: amb mogenerator fem que les classes màquines heredin de la meva classe (que alhora ereda de NSManagedObject) i així posar codi comú i utilitats que ens serveixin per totes les clases i no haver de repetir codi
//implementats en el DVDMyManagedObject els mètodes [awakeFromInsert, awakeFromFetch, willTurnIntoFault{]


#pragma mark - Utils
-(NSArray *) obsevableKeys{
    return @[DVDNoteAttributes.name,
             DVDNoteAttributes.text,
             DVDNoteRelationships.notebook,
             DVDNoteRelationships.photo,
             @"photo.photoData"];
}

#pragma mark - KVO
//alguns mètodes de KVO [setUpKVO, tearDownKVO] estan implementats en la classe DVDMyManagedObject
-(void) observeValueForKeyPath:(NSString *)keyPath
                      ofObject:(id)object
                        change:(NSDictionary *)change
                       context:(void *)context{
    
    //aquí només ens interessa saebr que alguna cosa ha canviat
    self.modificationDate = [NSDate date];
    
}

@end
