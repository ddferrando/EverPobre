//
//  AppDelegate.m
//  EverPobre
//
//  Created by david martínez ferrando on 2/2/15.
//  Copyright (c) 2015 david martínez ferrando. All rights reserved.
//

#import "AppDelegate.h"
#import "DVDCoreDataStack.h"
#import "DVDNote.h"
#import "DVDNotebook.h"
#import "DVDPhotoContainer.h"
#import "DVDNoteBooksViewController.h"
#import "UIViewController+Navigation.h"

@interface AppDelegate ()

@property (strong, nonatomic) DVDCoreDataStack *stack;
@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
    
    //creem l'stack passant com a nom el del model que hem creat Model.xcdatamodeld
    self.stack = [DVDCoreDataStack coreDataStackWithModelName:@"Model"];
    
    //crea dades de testeig
    [self createDummyData];
    
    
    //això era per anar fent proves
    //[self trastearConDatos];
    
    //creem el fetchRequest
    NSFetchRequest *r = [NSFetchRequest fetchRequestWithEntityName:[DVDNotebook entityName]];
    r.fetchBatchSize = 30;
    r.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:DVDNoteAttributes.name
                                                        ascending:YES
                                                         selector:@selector(caseInsensitiveCompare:)],
                          [NSSortDescriptor sortDescriptorWithKey:DVDNoteAttributes.modificationDate
                                                        ascending:NO]];
    
    //sectionNameKeyPath == les claus per les que podem organitzar les seccions de les taules
    NSFetchedResultsController * fc = [[NSFetchedResultsController alloc] initWithFetchRequest:r
                                                                          managedObjectContext:self.stack.context
                                                                            sectionNameKeyPath:nil
                                                                                     cacheName:nil];
    
    //crem el controlador
    DVDNoteBooksViewController *nbVC = [[DVDNoteBooksViewController alloc] initWithFetchedResultsController:fc
                                                                                                      style:UITableViewStylePlain];
    
    //Creem el NavigationviewControler
    //UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:nbVC];
    
    
    // Override point for customization after application launch.
    //self.window.rootViewController = nav;
    
    //fem servir una categoria per crear el elmateix que en les dues instruccions coemntades anteriorment
    self.window.rootViewController = [nbVC dvdWrappedNavigation];
    
    
    
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

#pragma mark - utils

-(void) createDummyData{
    
    //primer eliminem totes les dades per que no se'ns vagin acumilant les dades
    [self.stack zapAllData];
    
    //creem una llibreta
    DVDNotebook *nb = [DVDNotebook noteBookWithName:@"Llibreta 1" context:self.stack.context];
    
    //creem vàries notes
    [DVDNote noteWithName:@"Nota 1" notebook:nb context:self.stack.context];
    [DVDNote noteWithName:@"Nota 2" notebook:nb context:self.stack.context];
    [DVDNote noteWithName:@"Nota 3" notebook:nb context:self.stack.context];
    

}

-(void) trastearConDatos{
    
    DVDNotebook *nb = [DVDNotebook noteBookWithName:@"Llibreta 2" context:self.stack.context];
    
    DVDNote *idees = [DVDNote noteWithName:@"Idea 1" notebook:nb context:self.stack.context];
    
    //comprovem l'actualització modification date
    NSLog(@"Inicial; %@", idees.modificationDate);
    
    idees.text = @"crear una app";
    
    NSLog(@"Modificada; %@", idees.modificationDate);
    
    //cerca totes les notes
    NSFetchRequest * r = [NSFetchRequest fetchRequestWithEntityName:[DVDNote entityName]];
    
    //només limitat a que llegeidi de 20 en 20 per ajudar a adminstrar la memòria
    r.fetchBatchSize = 20;
    
    //ordenat per no ascendent i la data no
    r.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:DVDNoteAttributes.name
                                                        ascending:YES
                                                         selector:@selector(caseInsensitiveCompare:)],
                          [NSSortDescriptor sortDescriptorWithKey:DVDNoteAttributes.modificationDate
                                                        ascending:NO]];
    
    //apliquem un predicat per filtrar els continguts que compleixin el predicat i deixar fora
    
    r.predicate = [NSPredicate predicateWithFormat:@"notebook == %@", nb];
    //NSPredicate -- estudiar-los
    
    
    NSError *err = nil;
    
    NSArray *res = [self.stack.context executeFetchRequest:r
                                                     error:&err];
    
    
    if (res == nil) {
        NSLog(@"Error al cercar %@", err);
    }
    
    NSLog(@"Numero de notes: %lu", (unsigned long)[res count]);
    
    NSLog(@"Classe: %@", [res class]);
    
    
    //esborar un element
    [self.stack.context deleteObject:nb];
                          
                          
    //exercici -- crear un mètode a la classe de l'stack el mètode executeFetchRequest:r withErrorBlock:&err];
    // de la mateixa forma que ho fa el mètode //tant la cerca com el desat pot generar un error
    // -(void) saveWithErrorBlock: (void(^)(NSError *error))errorBlock;
    
    
    if(res == nil){
        NSLog(@"Error en la cerca %@", err);
    }
    
    NSLog(@"Numero de notes: %lu", (unsigned long)[res count]);
    
    NSLog(@"Notes restants: %@", res);
    
    
    //desar
    
    [self.stack saveWithErrorBlock:^(NSError *error) {
        NSLog(@"ERror al desar: %@" , err);
    }];

}

@end










