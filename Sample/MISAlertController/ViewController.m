//
//  ViewController.m
//  MISAlertController
//
//  Created by Michael Schneider on 9/28/14.
//  Copyright (c) 2014 mischneider.net. All rights reserved.
//

#import "ViewController.h"
#import "MISAlertController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UISwitch *securedTextFieldSwitch;
@property (weak, nonatomic) IBOutlet UISwitch *showCenteredSwitch;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)showAlertView:(id)sender
{
    MISAlertController *alertController = [MISAlertController alertControllerWithTitle:@"Title" message:@"Message" preferredStyle:UIAlertControllerStyleAlert];
    
    __block UITextField *textField = nil;
    [alertController addTextFieldWithConfigurationHandler:^(UITextField *theTextField) {
        textField = theTextField;
        textField.secureTextEntry = self.securedTextFieldSwitch.on;
        textField.text = @"Some text";
        textField.placeholder = @"Placeholder";
    }];
    
    MISAlertAction *okAction = [MISAlertAction actionWithTitle:NSLocalizedString(@"OK", nil) style:UIAlertActionStyleDefault handler:^(MISAlertAction *action) {
        NSString *result = textField.text;
        NSLog(@"Text Field: %@", result);
    }];
    
    MISAlertAction *cancelAction = [MISAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil) style:UIAlertActionStyleCancel handler:^(MISAlertAction *action) {
        NSLog(@"Cancel");
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:okAction];
    
    [alertController showInViewController:self animated:YES];
}

- (IBAction)showActionSheet:(id)sender
{
    MISAlertController *alertController = [MISAlertController alertControllerWithTitle:@"Title" message:@"Message" preferredStyle:UIAlertControllerStyleActionSheet];
    
    MISAlertAction *cancelAction = [MISAlertAction actionWithTitle:NSLocalizedString(@"Cancel", nil) style:UIAlertActionStyleCancel handler:^(MISAlertAction *action) {
        NSLog(@"Cancel");
    }];
    
    MISAlertAction *actionOne = [MISAlertAction actionWithTitle:NSLocalizedString(@"Action 1", nil) style:UIAlertActionStyleDefault handler:^(MISAlertAction *action) {
        NSLog(@"Action 1");
    }];
    
    MISAlertAction *actionTwo = [MISAlertAction actionWithTitle:NSLocalizedString(@"Action 2", nil) style:UIAlertActionStyleDefault handler:^(MISAlertAction *action) {
        NSLog(@"Action 2");
    }];
    
    [alertController addAction:cancelAction];
    [alertController addAction:actionOne];
    [alertController addAction:actionTwo];
    
    if (self.showCenteredSwitch.on) {
        [alertController showInViewController:self animated:YES];
        return;
    }
    
    [alertController showFromSourceView:sender inViewController:self animated:YES];

}

@end
