//
//  FirstViewController.m
//  iOSCourse
//
//  Created by Preto on 06/11/14.
//  Copyright (c) 2014 CIT. All rights reserved.
//

#import "FirstViewController.h"
#import "HomeViewController.h"
#import "Person.h"
#import "Person+Accessor.h"
#import "Session.h"
#import "AppDelegate.h"

@interface FirstViewController ()
@property (weak, nonatomic) IBOutlet UITextField *firstNameTextField;
@property (weak, nonatomic) IBOutlet UITextField *lastNameTextField;

@end

@implementation FirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self setTitle:@"First View"];
}

- (IBAction)singIn:(id)sender {
    if ([self checkTextFields]) {
        HomeViewController *homeViewController = [[HomeViewController alloc] initWithNibName:@"HomeViewController"
                                                                                      bundle:nil];
        
        NSString *firstName = self.firstNameTextField.text;
        NSString *lastName = self.lastNameTextField.text;
        
        AppDelegate *appDelegate = [UIApplication sharedApplication].delegate;
        Person *person = [Person insertNewObjectInManagedObjectContext:appDelegate.managedObjectContext withName:firstName andLastName:lastName];
        
        Session *session = [Session sharedSession];
        session.person = person;
        
//        [homeViewController setPerson:person];
        
        [self.navigationController pushViewController:homeViewController animated:YES];
    } else {
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Attention"
                                                            message:@"Please, fill out the fields."
                                                           delegate:nil
                                                  cancelButtonTitle:@"Ok"
                                                  otherButtonTitles:nil];
        [alertView show];
    }
}

- (BOOL)checkTextFields{
    
    NSString *firstName = self.firstNameTextField.text;
    NSString *lastName = self.lastNameTextField.text;
    
    BOOL isTextFieldsValide = NO;
    
    if (![firstName isEqualToString:@""] && ![lastName isEqualToString:@""]) {
        isTextFieldsValide = YES;
    }
    
    return isTextFieldsValide;
}

@end
