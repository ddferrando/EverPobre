#import "_DVDNote.h"

@interface DVDNote : _DVDNote {}
// Custom logic goes here.


+(instancetype) noteWithName: (NSString *) name
                    notebook: (DVDNotebook *) notebook
                     context:(NSManagedObjectContext*) context;
@end
