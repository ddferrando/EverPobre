// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DVDPhotoContainer.h instead.

@import CoreData;
#import "DVDMyManagedObject.h"

extern const struct DVDPhotoContainerAttributes {
	__unsafe_unretained NSString *photoData;
} DVDPhotoContainerAttributes;

extern const struct DVDPhotoContainerRelationships {
	__unsafe_unretained NSString *notes;
} DVDPhotoContainerRelationships;

@class DVDNote;

@interface DVDPhotoContainerID : NSManagedObjectID {}
@end

@interface _DVDPhotoContainer : DVDMyManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DVDPhotoContainerID* objectID;

@property (nonatomic, strong) NSData* photoData;

//- (BOOL)validatePhotoData:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSSet *notes;

- (NSMutableSet*)notesSet;

@end

@interface _DVDPhotoContainer (NotesCoreDataGeneratedAccessors)
- (void)addNotes:(NSSet*)value_;
- (void)removeNotes:(NSSet*)value_;
- (void)addNotesObject:(DVDNote*)value_;
- (void)removeNotesObject:(DVDNote*)value_;

@end

@interface _DVDPhotoContainer (CoreDataGeneratedPrimitiveAccessors)

- (NSData*)primitivePhotoData;
- (void)setPrimitivePhotoData:(NSData*)value;

- (NSMutableSet*)primitiveNotes;
- (void)setPrimitiveNotes:(NSMutableSet*)value;

@end
