//
//  RYLDevActionSheetViewController.m
//  Pods-RYLDevHelper_Example
//
//  Created by ryan on 2018/1/9.
//

#import "RYLDevActionSheetViewController.h"

@interface RYLDevActionSheetViewController () <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic ) UITableView *tableView;
@property (nonatomic ) NSMutableDictionary *actionContainer;

@end

static NSString *const kRYLDevActionCell = @"kRYLDevActionCell";

@implementation RYLDevActionSheetViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
}

-(NSMutableDictionary  *) actionContainer{
    if (!_actionContainer){
        _actionContainer = [NSMutableDictionary dictionary];
    }
    return _actionContainer;
}

-(void ) registerActionWithTitle:(NSString *)title action:(RYLDevCommonActionBlock )action{
    [self.actionContainer setObject:action forKey:title];
    [self.tableView reloadData];
}

-(UITableView  *) tableView{
    if (!_tableView){
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        _tableView.rowHeight = 44;
        [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kRYLDevActionCell];
        [self.view addSubview:_tableView];
    }
    return _tableView;
}

-(void ) viewDidLayoutSubviews{
    self.tableView.frame = self.view.bounds;
}

-(NSInteger ) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.actionContainer.count;
}

-(UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:kRYLDevActionCell];
    cell.textLabel.text = [[self.actionContainer allKeys] objectAtIndex:indexPath.row];
    return cell;
}

-(void ) tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    RYLDevCommonActionBlock block = [self.actionContainer objectForKey:[self.actionContainer.allKeys objectAtIndex:indexPath.row]];
    if (block){
        block();
    }
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

@end
