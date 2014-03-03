/* AppController */

#import <Cocoa/Cocoa.h>

@interface AppController : NSObject
{
	IBOutlet NSTextView	*outputCopy;
}

- (void)deviceMounted:(NSNotification *)notification;

@end
