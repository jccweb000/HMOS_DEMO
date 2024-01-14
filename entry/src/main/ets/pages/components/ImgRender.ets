@Component
export struct ImgRender {
  aboutToAppear() {
    console.log('组件即将执行build')
  }

  aboutToDisappear() {
    console.log('组件即将销毁')
  }

  build () {
    Flex() {
      Column() {
        Image($r('app.media.icon'))
          .width(30)
      }
      .width('100%')
    }
    .width('100%')
  }
}