#import "AppController.h"

@implementation AppController

+ (void)initialize
{
	/*NSMutableDictionary *defaultValues = [NSMutableDictionary dictionary];
	[defaultValues setObject:[NSString stringWithString:@" "] forKey:@"DRCharacterToAdd"];
	[[NSUserDefaults standardUserDefaults] registerDefaults:defaultValues];
	NSLog(@"registered defaults");*/
}

- (id)init
{
	[super init];
	
	[[[NSWorkspace sharedWorkspace] notificationCenter] addObserver:self 
														   selector:@selector(deviceMounted:) 
															   name:NSWorkspaceDidMountNotification
															 object:[NSWorkspace sharedWorkspace]];
	
	return self;
}

- (void)dealloc
{
	[super dealloc];
}

- (void)deviceMounted:(NSNotification *)notification {
	
	NSString *devicePath = [[notification userInfo] objectForKey:@"NSDevicePath"];
	NSLog(@"Recieved Mount Notification: [%@]",devicePath);	
	
	
	
	/*NSString *newDirName =[[[[[NSFileManager defaultManager] directoryContentsAtPath:devicePath] objectAtIndex:0] lastPathComponent] stringByDeletingPathExtension];
	
	if(([newDirName caseInsensitiveCompare:@"Divx"] == NSOrderedSame) || 
	   ([newDirName caseInsensitiveCompare:@"Click Me First"] == NSOrderedSame) ||
	   ([newDirName caseInsensitiveCompare:@"DIVX - 3.1"] == NSOrderedSame) ||
	   ([[[[[NSFileManager defaultManager] directoryContentsAtPath:devicePath] objectAtIndex:0] pathExtension] caseInsensitiveCompare:@"EXE"] == NSOrderedSame))
	
		newDirName =[[[[[NSFileManager defaultManager] directoryContentsAtPath:devicePath] objectAtIndex:1] lastPathComponent] stringByDeletingPathExtension];
	
	NSString *toPath = [@"/Volumes/Movies 1/Old/" stringByAppendingString:newDirName];
	
	//newDirName=[[newDirName componentsSeparatedByString:@" "] componentsJoinedByString:@"\\ "];*/

	// Set up variables
    NSTask *myTask = [[NSTask alloc] init];
    NSArray *myArguments = [NSArray arrayWithObjects:@"-r", devicePath, @"/Volumes/Movies 1/Old/", nil];
    [myTask setLaunchPath:@"/bin/cp"];
    [myTask setArguments: myArguments];
	[myTask launch];
    [myTask waitUntilExit];

	NSBeep();
	
	[[NSWorkspace sharedWorkspace] unmountAndEjectDeviceAtPath:[[notification userInfo] objectForKey:@"NSDevicePath"]];
}



@end
