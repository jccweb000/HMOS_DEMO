import router from '@ohos.router';

@Entry
@Component
export struct AppStoragePage {
  @StorageLink('name') linkName: string = 'linName';
  @StorageProp('name') propName: string = 'propName';

  onBackPress() {
    console.log('二级页面触发返回')
  }

  build() {
    Flex({ direction: FlexDirection.Column }) {
      Button('返回首页')
      .onClick(() => {
        router.back({
          url: 'pages/Index'
        });
      })
      Column() {
        Text(`linkName: ${this.linkName}`)
        Text(`propName: ${this.propName}`)
        Button('change linkName')
          .onClick(() => {
            this.linkName = '吴彦祖';
          })
        Button('change propName')
          .onClick(() => {
            this.propName = '陈冠希';
          })
        Button('set name的值')
          .onClick(() => {
            AppStorage.Set('name', 'new name')
          })
      }
      .width('100%')
    }
    .height('100%')
  }
}