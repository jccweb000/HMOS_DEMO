import { HomeContent } from './components/HomeContent';

@Entry
@Component
struct TabsPage {
  private tabsController : TabsController = new TabsController();
  @State currentIndex:number = 0;

  @Builder
  tabBarRender (title: string, index: number, activeIcon: Resource, normalIcon: Resource) {
    Column() {
      Image(this.currentIndex === index ? activeIcon : normalIcon)
        .width(25).height(25).margin({ bottom: 5 })
      Text(title).fontColor(this.currentIndex === index ? '#1296db' : Color.Black)
    }
    .height('100%').padding({ top: 5 })
    .onClick(() => {
      this.currentIndex = index;
      this.tabsController.changeIndex(this.currentIndex);
    })
  }

  build() {
    Column() {
      Tabs({ barPosition: BarPosition.End, controller: this.tabsController }) {
        TabContent() {
          HomeContent().height('100%')
        }.tabBar(this.tabBarRender('首页', 0, $r('app.media.ic_home_active'), $r('app.media.ic_home')))
        TabContent() {
          Text('我的内容')
        }.tabBar(this.tabBarRender('我的', 1, $r('app.media.ic_user_active'), $r('app.media.ic_user')))
      }
    }

  }
}