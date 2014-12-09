//
//  ProgressViewController.m
//  iOSCourse
//
//  Created by Salmo Roberto da Silva Junior on 12/6/14.
//  Copyright (c) 2014 CIT. All rights reserved.
//

#import "ProgressViewController.h"
#import "ProgressView.h"

@interface ProgressViewController ()

@property (strong, nonatomic) IBOutlet ProgressView *mainView;

@property (nonatomic, strong) NSOperationQueue *queue;
@property (nonatomic, strong) NSArray *operations;

@end

@implementation ProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setTitle:@"Progress View"];
    [self.mainView setupProgressViews];
}

- (ProgressView *)mainView
{
    ProgressView *view = (ProgressView *)self.view;
    return view;
}

- (IBAction)startAllProgress:(UIButton *)sender {
    [self.queue cancelAllOperations];
    [self.mainView resetAllProgressViews];
    [self createOperations];
}

- (NSOperationQueue *)queue
{
    if (!_queue) {
        _queue = [[NSOperationQueue alloc] init];
    }
    
    return _queue;
}

- (NSBlockOperation *)addOperationWithProgressView:(UIProgressView *)progress andFinalCount:(NSInteger)count andTimeInterval:(CGFloat)interval
{
    NSBlockOperation *operation = [NSBlockOperation new];
    
    __weak NSBlockOperation *weakOperation = operation;
    
    [operation addExecutionBlock:^{
        for (int i = 1; i <= count; i++) {
            
            int random = arc4random()%25;
            if (random == 4) {
                [weakOperation cancel];
                
                [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                    [self.mainView cancelProgress:progress];
                }];
                
                break;
            }
            
            [NSThread sleepForTimeInterval:interval];
            
            
            [[NSOperationQueue mainQueue] addOperationWithBlock:^{
                [self.mainView setprogress:progress withInterval:((CGFloat)i/count)];
            }];
        }
    }];
    
    return operation;
}

- (void)createOperations
{
    NSBlockOperation *operation1 = [self addOperationWithProgressView:self.mainView.progress1 andFinalCount:12 andTimeInterval:1.2];
    NSBlockOperation *operation2 = [self addOperationWithProgressView:self.mainView.progress2 andFinalCount:20 andTimeInterval:1.5];
    NSBlockOperation *operation3 = [self addOperationWithProgressView:self.mainView.progress3 andFinalCount:27 andTimeInterval:0.8];
    NSBlockOperation *operation4 = [self addOperationWithProgressView:self.mainView.progress4 andFinalCount:8 andTimeInterval:2.0];
    
    
    NSBlockOperation *lastOperation = [NSBlockOperation new];
    
    [lastOperation addExecutionBlock:^{
        [[NSOperationQueue mainQueue] addOperationWithBlock:^{
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Alert" message:@"Done!" delegate:nil cancelButtonTitle:@"Ok" otherButtonTitles:nil];
            [alertView show];
        }];
    }];
    
    self.operations = @[operation1, operation2, operation3, operation4, lastOperation];
    
    [lastOperation addDependency:operation1];
    [lastOperation addDependency:operation2];
    [lastOperation addDependency:operation3];
    [lastOperation addDependency:operation4];
    
    [operation3 setQueuePriority:NSOperationQueuePriorityVeryHigh];
    [operation2 setQueuePriority:NSOperationQueuePriorityVeryLow];
    
    self.queue.maxConcurrentOperationCount = 4;
    
    [self.queue addOperations:self.operations waitUntilFinished:NO];
}

@end
