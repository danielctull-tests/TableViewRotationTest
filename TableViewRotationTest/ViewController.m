//
//  ViewController.m
//  TableViewRotationTest
//
//  Created by Daniel Tull on 17.01.2013.
//  Copyright (c) 2013 Daniel Tull. All rights reserved.
//

#import "ViewController.h"
#import "TableViewCell.h"

@implementation ViewController {
	NSArray *_strings;
}

- (void)viewDidLoad {
	[super viewDidLoad];

	NSString *cellName = NSStringFromClass([TableViewCell class]);
	UINib *nib = [UINib nibWithNibName:cellName bundle:nil];
	[self.tableView registerNib:nib forCellReuseIdentifier:cellName];

	_strings = @[
		@"Override to support conditional editing of the table view.",
		@"Override to support editing the table view.",
		@"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
		@"String.",
		@"String.",
		@"String.",
		@"String.",
		@"String.",
		@"String.",
		@"String.",
		@"Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
		@"String.",
		@"String.",
		@"String.",
		@"String.",
		@"String.",
		@"String.",
		@"String.",
		@"String.",
		@"String.",
		@"String.",
		@"String."
	];

}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [_strings count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
	return [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([TableViewCell class])];
}

- (void)tableView:(UITableView *)tableView willDisplayCell:(TableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
	cell.label.text = [_strings objectAtIndex:indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
	NSString *string = [_strings objectAtIndex:indexPath.row];

	// We take away 20 points for the padding of the label and add it to the size we get.
	CGSize size = [string sizeWithFont:[UIFont systemFontOfSize:17.0f] constrainedToSize:CGSizeMake(tableView.bounds.size.width - 20.0f, CGFLOAT_MAX)];
	return size.height + 20.0f;
}

@end
