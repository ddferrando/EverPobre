// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DVDNote.m instead.

#import "_DVDNote.h"

const struct DVDNoteAttributes DVDNoteAttributes = {
	.creationDate = @"creationDate",
	.modificationDate = @"modificationDate",
	.name = @"name",
	.text = @"text",
};

const struct DVDNoteRelationships DVDNoteRelationships = {
	.notebook = @"notebook",
	.photo = @"photo",
};

@implementation DVDNoteID
@end

@implementation _DVDNote

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"Note" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"Note";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"Note" inManagedObjectContext:moc_];
}

- (DVDNoteID*)objectID {
	return (DVDNoteID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic creationDate;

@dynamic modificationDate;

@dynamic name;

@dynamic text;

@dynamic notebook;

@dynamic photo;

@end

