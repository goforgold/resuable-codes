#import "MyUIViewController.h"

@interface MyUIViewController ()

{
    UIEdgeInsets currentInsets;
    CGPoint currentOffset;
    
    NSString *letters;
}

@end

@implementation MyUIViewController

+ (UIImage*)resizeImage:(UIImage*)image toFitInSize:(CGSize)toSize
{
    UIImage *result = image;
    CGSize sourceSize = image.size;
    CGSize targetSize = toSize;
    
    BOOL needsRedraw = NO;
    
    if (sourceSize.width > toSize.width) {
        
        CGFloat ratioChange = (sourceSize.width - toSize.width) * 100 / sourceSize.width;
        
        toSize.height = sourceSize.height - (sourceSize.height * ratioChange / 100);
        
        needsRedraw = YES;
    }
    
    if (toSize.height < targetSize.height) {
        
        CGFloat ratioChange = (targetSize.height - toSize.height) * 100 / targetSize.height;
        
        toSize.height = targetSize.height;
        toSize.width = toSize.width + (toSize.width * ratioChange / 100);
        
        needsRedraw = YES;
    }
    
    if (needsRedraw) {
        UIGraphicsBeginImageContext(toSize);
        [image drawInRect:CGRectMake(0.0, 0.0, toSize.width, toSize.height)];
        result = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    
    return result;
}

@end