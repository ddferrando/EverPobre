//
//  DVDMyManagedObject.m
//  EverPobre
//
//  Created by david martínez ferrando on 2/2/15.
//  Copyright (c) 2015 david martínez ferrando. All rights reserved.
//

#import "DVDMyManagedObject.h"

@implementation DVDMyManagedObject


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
    //   return @[DVDNotebookAttributes.name, DVDNotebookRelationships.notes];
    return nil;
}

#pragma mark - KVO
-(void) setUpKVO{
    //ens donem d'alta en el KVO per enviar el missatge que volguem
    
    //Opcions per que passi el valor antic i nou
    //NSKeyValueObservingOptionNew | NSKeyValueObservingOptionOld
    //el nou no ens fa falta
    for (NSString *key in [self obsevableKeys]){
        [self addObserver:self
               forKeyPath:key
                  options:0
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

@end
