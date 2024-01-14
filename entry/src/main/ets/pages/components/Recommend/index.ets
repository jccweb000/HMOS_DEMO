import { RecommendList } from './List';

@Component
export struct RecommendCom {
  build() {
    Column() {
      Flex({ justifyContent: FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }){
        Text() {
          Span('听')
          Span('周杰伦').fontWeight(600).margin({ left: 10, right: 10 })
          Span('的也在听')
        }.fontSize(16)
        Image($r('app.media.ic_more')).width(16).height(16)
      }.margin({ bottom: 10 }).width('100%')
      RecommendList().width('90%')
    }.margin({ top: 10 }).height(400)
  }
}