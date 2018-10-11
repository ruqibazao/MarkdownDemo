//
//  ViewController.m
//  BKMarkdownDemo
//
//  Created by nenhall_work on 2018/10/10.
//  Copyright © 2018 nenhall_studio. All rights reserved.
//

#import "ViewController.h"
//#import <BKMarkdown/BKMarkdown.h>
#import "BKMarkdownDemo-Swift.h"

@interface ViewController ()
@property (nonatomic, strong) NSData *data;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (nonatomic, copy) NSString *content;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *rightItem;
@property (nonatomic, weak) MarkdownView *mdView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    [_textView setHidden:YES];
    
    MarkdownView *mdView = [[MarkdownView alloc] init];
    mdView.frame = self.view.bounds;
    mdView.backgroundColor = [UIColor redColor];
    _mdView = mdView;
    
    _data = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"https://raw.githubusercontent.com/matteocrippa/awesome-swift/master/README.md"]];
    
    
    NSString *directory = [NSHomeDirectory() stringByAppendingString:@"/Documents/穿越318线川藏游记.md"];
    NSString *path2 = [[NSBundle mainBundle] pathForResource:@"穿越318线川藏游记.md" ofType:nil];
    
    
    NSURL *url = [NSURL fileURLWithPath:path2];
    NSURL *url2 = [NSURL URLWithString:@"https://raw.githubusercontent.com/matteocrippa/awesome-swift/master/README.md"];

    _content = [NSString stringWithContentsOfURL:url2 encoding:NSUTF8StringEncoding error:nil];
    
    [mdView loadWithMarkdown:_content enableImage:YES];

    
    
    
    [self.view addSubview:mdView];
}


-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
  

    
}


- (IBAction)edit:(id)sender {
    
    _textView.text = _content;
    [_mdView setHidden:YES];
    [_textView setHidden:NO];
}

@end
