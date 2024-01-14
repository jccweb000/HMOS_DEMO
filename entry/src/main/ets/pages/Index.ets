AppStorage.SetOrCreate('name', 'init');
import router from '@ohos.router';
import { ImgRender } from './components/ImgRender';

@Entry
@Component
struct Index {
  @StorageProp('name') name: string = 'IndexName';
  @State showImg: boolean = false;

  // 生命周期
  onPageShow() {
    console.log('页面展示')
  }

  onPageHide() {
    console.log('页面隐藏')
  }

  onBackPress() {
    console.log('返回的生命周期函数')
  }

  build() {
    Flex({ direction: FlexDirection.Column }) {
      Column() {
        Text() {
          Span('appStorage name:')
          Span(`${this.name}`).fontColor(Color.Red).fontSize(20)
        }
          .width('100%').backgroundColor(Color.Gray).padding(10).textAlign(TextAlign.Center).margin(10)
        Button('AppStoragePage')
          .onClick(() => {
            router.pushUrl({
              url: 'pages/AppStoragePage'
            })
          })
      }.width('100%')
      Divider().margin(10)
      Flex({direction: FlexDirection.Column, justifyContent: FlexAlign.Center}) {
        Text('自定义组件').width('100%').textAlign(TextAlign.Center).fontWeight(600)
        Button(`${this.showImg ? '销毁组件' : '展示组件'}`)
          .onClick(() => {
            this.showImg = !this.showImg;
          })
        if (this.showImg) {
          ImgRender()
            .padding(20)
            .width('100%')
        } else {
          Text('Img组件被销毁了').fontColor(Color.Red)
        }
      }.height(150)

    }
    .height('100%')
  }
}