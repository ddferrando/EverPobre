// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DVDNote.h instead.

@import CoreData;
#import "DVDMyManagedObject.h"

extern const struct DVDNoteAttributes {
	__unsafe_unretained NSString *creationDate;
	__unsafe_unretained NSString *modificationDate;
	__unsafe_unretained NSString *name;
	__unsafe_unretained NSString *text;
} DVDNoteAttributes;

extern const struct DVDNoteRelationships {
	__unsafe_unretained NSString *notebook;
	__unsafe_unretained NSString *photo;
} DVDNoteRelationships;

@class DVDNotebook;
@class DVDPhotoContainer;

@interface DVDNoteID : NSManagedObjectID {}
@end

@interface _DVDNote : DVDMyManagedObject {}
+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_;
+ (NSString*)entityName;
+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_;
@property (nonatomic, readonly, strong) DVDNoteID* objectID;

@property (nonatomic, strong) NSDate* creationDate;

//- (BOOL)validateCreationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSDate* modificationDate;

//- (BOOL)validateModificationDate:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* name;

//- (BOOL)validateName:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) NSString* text;

//- (BOOL)validateText:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) DVDNotebook *notebook;

//- (BOOL)validateNotebook:(id*)value_ error:(NSError**)error_;

@property (nonatomic, strong) DVDPhotoContainer *photo;

//- (BOOL)validatePhoto:(id*)value_ error:(NSError**)error_;

@end

@interface _DVDNote (CoreDataGeneratedPrimitiveAccessors)

- (NSDate*)primitiveCreationDate;
- (void)setPrimitiveCreationDate:(NSDate*)value;

- (NSDate*)primitiveModificationDate;
- (void)setPrimitiveModificationDate:(NSDate*)value;

- (NSString*)primitiveName;
- (void)setPrimitiveName:(NSString*)value;

- (NSString*)primitiveText;
- (void)setPrimitiveText:(NSString*)value;

- (DVDNotebook*)primitiveNotebook;
- (void)setPrimitiveNotebook:(DVDNotebook*)value;

- (DVDPhotoContainer*)primitivePhoto;
- (void)setPrimitivePhoto:(DVDPhotoContainer*)value;

@end
