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

@end
