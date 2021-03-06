//
//  CBubbleUserNotificationStyle.m
//  TouchCode
//
//  Created by Jonathan Wight on 10/13/09.
//  Copyright 2009 toxicsoftware.com. All rights reserved.
//
//  Permission is hereby granted, free of charge, to any person
//  obtaining a copy of this software and associated documentation
//  files (the "Software"), to deal in the Software without
//  restriction, including without limitation the rights to use,
//  copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the
//  Software is furnished to do so, subject to the following
//  conditions:
//
//  The above copyright notice and this permission notice shall be
//  included in all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
//  EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
//  OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
//  NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
//  HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
//  WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
//  FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
//  OTHER DEALINGS IN THE SOFTWARE.
//

#import "CBubbleUserNotificationStyle.h"

#import "CUserNotification.h"
#import "CBubbleView.h"
#import "UIView_AnimationExtensions.h"
#import "CUserNotificationManager.h"

@implementation CBubbleUserNotificationStyle

+ (void)load
{
NSAutoreleasePool *thePool = [[NSAutoreleasePool alloc] init];
[[CUserNotificationManager instance] registerStyleName:@"BUBBLE-TOP" class:self options:NULL];
[thePool release];
}

- (void)showNotification:(CUserNotification *)inNotification
{
UIView *theMainView = self.manager.mainView;

CBubbleView *theBubbleView = [[[CBubbleView alloc] initWithFrame:CGRectMake(0, 0, theMainView.bounds.size.width, 44)] autorelease];
theBubbleView.titleLabel.text = inNotification.title;
theBubbleView.messageLabel.text = inNotification.message;
//UIView *theAccessoryView = NULL;
//if (inNotification.progress >= 0.0 && inNotification.progress <= 1.0)
//	{
//	UIProgressView *theProgressView = [[[UIProgressView alloc] initWithProgressViewStyle:UIProgressViewStyleDefault] autorelease];
//	theProgressView.progress = inNotification.progress;
//	theProgressView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
//
//	UIView *theCenteringView = [[[UIView alloc] initWithFrame:CGRectInset(theProgressView.bounds, -10, -10)] autorelease];
//	[theCenteringView addSubview:theProgressView];
//
//	theAccessoryView = theCenteringView;
//	}
//else if (isinf(inNotification.progress))
//	{
//	UIActivityIndicatorView *theActivityView = [[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge] autorelease];
//	theActivityView.hidesWhenStopped = NO;
//	theActivityView.autoresizingMask = UIViewAutoresizingFlexibleLeftMargin | UIViewAutoresizingFlexibleRightMargin | UIViewAutoresizingFlexibleTopMargin | UIViewAutoresizingFlexibleBottomMargin;
//	[theActivityView startAnimating];
//
//	UIView *theCenteringView = [[[UIView alloc] initWithFrame:CGRectInset(theActivityView.bounds, -10, -10)] autorelease];
//	[theCenteringView addSubview:theActivityView];
//
//	theAccessoryView = theCenteringView;
//	}
////if (theAccessoryView)
////	theBubbleView.accessoryViews = [NSArray arrayWithObject:theAccessoryView];

self.view = theBubbleView;

[theMainView addSubview:view withAnimationType:ViewAnimationType_SlideDown];
}

- (void)hideNotification:(CUserNotification *)inNotification
{
[self.view removeFromSuperviewWithAnimationType:ViewAnimationType_SlideUp];
}


@end
