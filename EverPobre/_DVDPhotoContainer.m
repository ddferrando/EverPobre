// DO NOT EDIT. This file is machine-generated and constantly overwritten.
// Make changes to DVDPhotoContainer.m instead.

#import "_DVDPhotoContainer.h"

const struct DVDPhotoContainerAttributes DVDPhotoContainerAttributes = {
	.photoData = @"photoData",
};

const struct DVDPhotoContainerRelationships DVDPhotoContainerRelationships = {
	.notes = @"notes",
};

@implementation DVDPhotoContainerID
@end

@implementation _DVDPhotoContainer

+ (id)insertInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription insertNewObjectForEntityForName:@"PhotoContainer" inManagedObjectContext:moc_];
}

+ (NSString*)entityName {
	return @"PhotoContainer";
}

+ (NSEntityDescription*)entityInManagedObjectContext:(NSManagedObjectContext*)moc_ {
	NSParameterAssert(moc_);
	return [NSEntityDescription entityForName:@"PhotoContainer" inManagedObjectContext:moc_];
}

- (DVDPhotoContainerID*)objectID {
	return (DVDPhotoContainerID*)[super objectID];
}

+ (NSSet*)keyPathsForValuesAffectingValueForKey:(NSString*)key {
	NSSet *keyPaths = [super keyPathsForValuesAffectingValueForKey:key];

	return keyPaths;
}

@dynamic photoData;

@dynamic notes;

- (NSMutableSet*)notesSet {
	[self willAccessValueForKey:@"notes"];

	NSMutableSet *result = (NSMutableSet*)[self mutableSetValueForKey:@"notes"];

	[self didAccessValueForKey:@"notes"];
	return result;
}

@end

