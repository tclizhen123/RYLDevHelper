//
//  RYLDevActionSheetViewController.h
//  Pods-RYLDevHelper_Example
//
//  Created by ryan on 2018/1/9.
//

#import <UIKit/UIKit.h>

typedef void (^RYLDevCommonActionBlock) (void);

@interface RYLDevActionSheetViewController : UIViewController

-(void ) registerActionWithTitle:(NSString *)title action:(RYLDevCommonActionBlock )action;

@end
