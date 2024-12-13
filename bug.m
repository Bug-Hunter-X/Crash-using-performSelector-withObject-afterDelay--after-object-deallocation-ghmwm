This bug occurs when using the `performSelector:withObject:afterDelay:` method in Objective-C. If the object whose selector is being performed is deallocated before the delay expires, a crash will occur.  This is because the selector is still scheduled to be executed, but the target object no longer exists.

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
        [obj performSelector:@selector(myMethod) withObject:nil afterDelay:2.0];
        obj = nil; // Deallocates the object
    }
    return 0;
}
```