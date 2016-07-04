//
//  HomePageViewController.m
//  HCFunwear
//
//  Created by 刘海川 on 16/5/26.
//  Copyright © 2016年 Haichuan Liu. All rights reserved.
//

#import "HomePageViewController.h"
#import "GlobalContext.h"

#import "UIImageView+YYWebImage.h"
#import "Masonry.h"
#import "HCCirculateScrollViewCell.h"
#import "HCGridMenuViewCell.h"
#import "SinglePageAdvertViewCell.h"
#import "HomePageViewModel.h"
#import "GlobalColors.h"
#import "NewUserFeastViewCell.h"
#import "HotCategoryViewCell.h"
#import "PopularBrandsViewCell.h"
#import "FushionTrendViewCell.h"
#import "ShopTheLookViewCell.h"
#import "MagazineInfoViewCell.h"
#import "WearTemplateViewCell.h"

@interface HomePageViewController ()
<
    UICollectionViewDataSource,
    UICollectionViewDelegate,
    HCCirculateScrollViewProtocol
>
{
    UICollectionView *_homePageCollectionView;
    HomePageViewModel *_homePageViewModel;
}

@end

#pragma mark - cell indentifier
static NSString *kCirculateScrollCellIdentifier = @"kCirculateScrollCellIdentifier";
static NSString *kGridMenuCellIdentifier = @"kGridMenuCellIdentifier";
static NSString *kSinglePageAdvertCellIdentifier = @"kSinglePageAdvertCellIdentifier";
static NSString *kNewUserFeastCellIdentifier = @"kNewUserFeastCellIdentifier";
static NSString *kHotCategoryViewCellIdentifier = @"kHotCategoryViewCellIdentifier";
static NSString *kPopularBrandsViewCellIdentifier = @"kPopularBrandsViewCellIdentifier";
static NSString *kFushionTrendViewCellIdentifier = @"kFushionTrendViewCellIdentifier";
static NSString *kShopTheLookViewCellIdentifier = @"kShopTheLookViewCellIdentifier";
static NSString *kMagazineInfoViewCellIdentifier = @"kMagazineInfoViewCellIdentifier";
static NSString *kWearTemplateViewCellIdentifier = @"kWearTemplateViewCellIdentifier";

@implementation HomePageViewController

#pragma mark - life_cycle
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    _homePageViewModel = [HomePageViewModel new];
     [self initCollectionView];
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self configNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - initUI
- (void)initCollectionView {
    UICollectionViewFlowLayout *homePageCollectionLayout = [[UICollectionViewFlowLayout alloc]init];
    
    _homePageCollectionView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:homePageCollectionLayout];
    _homePageCollectionView.dataSource = self;
    _homePageCollectionView.delegate = self;
    _homePageCollectionView.backgroundColor = kCommonColor;
    [self.view addSubview:_homePageCollectionView];
    
    [_homePageCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.equalTo(self.view).offset(-49);
        make.top.equalTo(self.view).offset(64);
        make.left.right.equalTo(self.view);
    }];
    
    //注册 cell
    //广告轮播
    [_homePageCollectionView registerClass:[HCCirculateScrollViewCell class] forCellWithReuseIdentifier:kCirculateScrollCellIdentifier];
    //八宫格菜单
    [_homePageCollectionView registerClass:[HCGridMenuViewCell class] forCellWithReuseIdentifier:kGridMenuCellIdentifier];
    //单页广告
    [_homePageCollectionView registerClass:[SinglePageAdvertViewCell class] forCellWithReuseIdentifier:kSinglePageAdvertCellIdentifier];
    //新手专享
    [_homePageCollectionView registerClass:[NewUserFeastViewCell class]  forCellWithReuseIdentifier:kNewUserFeastCellIdentifier];
    //热门品类
    [_homePageCollectionView registerClass:[HotCategoryViewCell class] forCellWithReuseIdentifier:kHotCategoryViewCellIdentifier];
    //热门品牌
    [_homePageCollectionView registerClass:[PopularBrandsViewCell class] forCellWithReuseIdentifier:kPopularBrandsViewCellIdentifier];
    //搭配趋势
    [_homePageCollectionView registerClass:[FushionTrendViewCell class] forCellWithReuseIdentifier:kFushionTrendViewCellIdentifier];
    //限时搭配购
    [_homePageCollectionView registerClass:[ShopTheLookViewCell class] forCellWithReuseIdentifier:kShopTheLookViewCellIdentifier];
    //流行资讯
    [_homePageCollectionView registerClass:[MagazineInfoViewCell class] forCellWithReuseIdentifier:kMagazineInfoViewCellIdentifier];
    //穿戴:上装，下装，鞋履，包袋，配饰，男士护理，户外运动
    [_homePageCollectionView registerClass:[WearTemplateViewCell class] forCellWithReuseIdentifier:kWearTemplateViewCellIdentifier];
}

#pragma mark - configration
- (void)configNavigationBar {
    
    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 44)];
    leftButton.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 58);
    [leftButton setImage:[UIImage imageNamed:@"top_cebian"] forState:UIControlStateNormal];
    UIBarButtonItem *leftItem = [[UIBarButtonItem alloc]initWithCustomView:leftButton];
    [GlobalContext ShareInstance].mainTabBarController.navigationItem.leftBarButtonItem = leftItem;
    
    UIButton *rightButton = [[UIButton alloc]initWithFrame:CGRectMake(0, 0, 80, 44)];
    rightButton.imageEdgeInsets = UIEdgeInsetsMake(0, 58, 0, 0);
    [rightButton setImage:[UIImage imageNamed:@"top_search"] forState:UIControlStateNormal];
    UIBarButtonItem *rightItem = [[UIBarButtonItem alloc]initWithCustomView:rightButton];
    [GlobalContext ShareInstance].mainTabBarController.navigationItem.rightBarButtonItem = rightItem;
}

#pragma mark - UICollectionViewDelegateFlowLayout
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    CGFloat screenWidth = screenSize.width;
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {//79"160
            return CGSizeMake(screenWidth, screenWidth/160.0*79);
        }
        else if (indexPath.row == 1) {//192"320
            return CGSizeMake(screenWidth, screenWidth/320.0*192);
        }
    }
    else if (indexPath.section == 1) {
        //99:320
        return CGSizeMake(screenWidth, screenWidth/320.0*99);
    }
    else if (indexPath.section == 2) {
        return CGSizeMake(screenWidth, 43 + screenWidth/8.0*5 + screenWidth/320.0*174);
    }
    else if (indexPath.section == 3) {
        return CGSizeMake(screenWidth, 43 + screenWidth/320.0*374);
    }
    else if (indexPath.section == 4) {
        return CGSizeMake(screenWidth, 43 + screenWidth/16.0*9);
    }
    else if (indexPath.section == 5) {
        return CGSizeMake(screenWidth, 43 + screenWidth/2.0);
    }
    else if (indexPath.section == 6) {
        return CGSizeMake(screenWidth, 43 + screenWidth/32.0*17);
    }
    else if (indexPath.section == 7) {
        return CGSizeMake(screenWidth, 43 + screenWidth/40.0*23 + 61);
    }
    else if (indexPath.section == 8 || indexPath.section == 9 || indexPath.section == 10 || indexPath.section == 11 || indexPath.section == 12 || indexPath.section == 13 || indexPath.section == 14) {
        return CGSizeMake(screenWidth, 43 + screenWidth/8.0*5 + screenWidth/32.0*17);
    }
    return CGSizeZero;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return CGSizeZero;
    }
    CGSize screenSize = [[UIScreen mainScreen] bounds].size;
    CGFloat screenWidth = screenSize.width;
    return CGSizeMake(screenWidth, 10);
}

/*
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section {
    return UIEdgeInsetsZero;
}
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section {
    return 0;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section {
    return CGSizeZero;
}
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForFooterInSection:(NSInteger)section {
    return CGSizeZero;
}
 */
#pragma mark - UICollectionViewDataSource
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 16;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    }
    return 1;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        if (indexPath.row == 0) {
            HCCirculateScrollViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kCirculateScrollCellIdentifier forIndexPath:indexPath];
            return cell;
        }
        else if (indexPath.row == 1) {
            HCGridMenuViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kGridMenuCellIdentifier forIndexPath:indexPath];
            [cell.gridMenuView reloadDataWithTypes:_homePageViewModel.gridMenuArray];
            return cell;
        }
    }
    else if (indexPath.section == 1) {
        SinglePageAdvertViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kSinglePageAdvertCellIdentifier forIndexPath:indexPath];
        return cell;
    }
    else if (indexPath.section == 2) {
        NewUserFeastViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kNewUserFeastCellIdentifier forIndexPath:indexPath];
        return cell;
    }
    else if (indexPath.section == 3) {
        HotCategoryViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kHotCategoryViewCellIdentifier forIndexPath:indexPath];
        return cell;
    }
    else if (indexPath.section == 4) {
        PopularBrandsViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kPopularBrandsViewCellIdentifier forIndexPath:indexPath];
        return cell;
    }
    else if (indexPath.section == 5) {
        FushionTrendViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kFushionTrendViewCellIdentifier forIndexPath:indexPath];
        return cell;
    }
    else if (indexPath.section == 6) {
        ShopTheLookViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kShopTheLookViewCellIdentifier forIndexPath:indexPath];
        return cell;
    }
    else if (indexPath.section == 7) {
        MagazineInfoViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kMagazineInfoViewCellIdentifier forIndexPath:indexPath];
        return cell;
    }
    else if (indexPath.section == 8 || indexPath.section == 9 || indexPath.section == 10 || indexPath.section == 11 || indexPath.section == 12 || indexPath.section == 13 || indexPath.section == 14) {
        WearTemplateViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:kWearTemplateViewCellIdentifier forIndexPath:indexPath];
        cell.wearTemplateView.headTitleView.headModel = _homePageViewModel.headTitleArray[indexPath.section-8];
        return cell;
    }
    return nil;
}
#pragma mark - UICollectionViewDelegate
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
}

#pragma mark - HCCirculateScrollViewProtocol # 广告轮播 #
- (void)circulateScrollView:(HCCirculateScrollView *)circulateSctollView
               loadImageUrl:(NSURL *)url
              withImageView:(UIImageView *)imageView {
    [imageView setImageWithURL:url placeholder:[UIImage imageNamed:@"fan_default_01"]];
}

- (void)circulateScrollViewDidSelectedAtIndex:(NSInteger)index {
    
}

- (void)circulateScrollViewPageControlAtIndex:(NSInteger)index {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
