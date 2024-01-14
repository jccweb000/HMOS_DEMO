import router from '@ohos.router';

@Component
export struct Header {
  @Prop title: string;

  aboutToAppear() {
    console.log('111')
  }

  build() {
    Row() {
      Image($r('app.media.ic_back'))
        .width(20).height(20).margin({ right: 20 }).fillColor(Color.Black)
        .onClick(() => {
          router.back()
        })
      Text(this.title).fontSize(18).fontWeight(600)
    }.borderWidth({ bottom: 1 }).borderColor('#ccc').width('100%').padding({ top: 5, right: 10, bottom: 5, left: 10}).height(60)
  }
}