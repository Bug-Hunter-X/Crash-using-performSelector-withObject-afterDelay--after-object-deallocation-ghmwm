# Objective-C Crash: `performSelector:withObject:afterDelay:` and Object Deallocation

This repository demonstrates a common Objective-C bug related to the `performSelector:withObject:afterDelay:` method.  If the object whose selector is invoked is deallocated before the delay expires, the application will crash.

## The Problem

The `performSelector:withObject:afterDelay:` method schedules a selector to be executed on a specific object after a given delay. If the object is deallocated before the delay completes, the selector attempts to execute on a non-existent object, resulting in a crash.

## Solution
The solution involves using a mechanism that handles potential object deallocation.  One such approach is to use blocks and GCD timers that retain a strong reference to the object.  Or use a weak reference to the object.