#import "_DVDNotebook.h"

@interface DVDNotebook : _DVDNotebook {}
// Custom logic goes here.

+(instancetype) noteBookWithName:(NSString *) name
                         context:(NSManagedObjectContext *) context;
@end
