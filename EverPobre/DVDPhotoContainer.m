#import "DVDPhotoContainer.h"

@interface DVDPhotoContainer ()

// Private interface goes here.

@end

@implementation DVDPhotoContainer

// Custom logic goes here.

-(UIImage *) image{
    return [UIImage imageWithData:self.photoData];
}

-(void) setImage:(UIImage *) image{
    
    //converteix la UIImage en un JPG amb una determinada compressió
    //podem convertir-la en png amb UIImagePNGRepresentation(<#UIImage *image#>) però sense pasar compressió
    
    self.photoData = UIImageJPEGRepresentation (image, 0.9);
}




@end
