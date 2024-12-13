```objectivec
#import <Foundation/Foundation.h>

@interface MyObject : NSObject
- (void)myMethod;
@end

@implementation MyObject
- (void)myMethod {
    NSLog(@"My method is executing");
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        MyObject *obj = [[MyObject alloc] init];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{ 
            // Check if the object is still valid. Use __weak to avoid retain cycle.
            __weak MyObject *weakObj = obj;
            if (weakObj) {
                [weakObj myMethod];
            }
        });
        obj = nil; // Deallocates the object
    }
    return 0;
}
```