//
//  SharingTestingData.m
//  AWAD
//
//  Created by user on 27.02.16.
//  Copyright © 2016 user. All rights reserved.
//

#import "SharingTestingData.h"

@implementation SharingTestingData


+(id)sharedInstance{
    static SharingTestingData *sharedInstance = nil;
    @synchronized(self) {
        if (sharedInstance == nil)
            sharedInstance = [[self alloc] init];
    }
    return sharedInstance;
}


- (instancetype)init
{
    self = [super init];
    if (self) {
        // HACK: burn database
//        NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
//        NSString *documentsDir = [docPaths objectAtIndex:0];
//        NSString *dbPath = [documentsDir stringByAppendingPathComponent:@"BrowserTest.sqlite"];
//        NSError *errorRemovingFile;
//        [[NSFileManager defaultManager] removeItemAtPath:dbPath error:&errorRemovingFile];
//        NSLog(@"*** Error removing database file before running tests: %@", errorRemovingFile);
        
        _testDALAssembly = [[[AWADTestDALAssembly alloc] init] activate];
    }
    return self;
}

@end
