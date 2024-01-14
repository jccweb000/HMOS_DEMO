import { RecommendCom } from './Recommend/index';
import { InternalAudio } from '../../view/Audio';

@Component
export struct HomeContent {
  private swiperController: SwiperController = new SwiperController();

  @Styles imgStyle () {
    .width('100%').height(100)
  }
  build() {
    Column() {
      Flex({ justifyContent:FlexAlign.SpaceBetween, alignItems: ItemAlign.Center }) {
        Search({ placeholder: '薛之谦新歌' }).width('70%').backgroundColor(Color.White)
        Image($r('app.media.ic_music')).width(20).height(20)
      }.margin({ bottom: 10 })
      Flex({ alignItems: ItemAlign.Center }) {
        Row() {
          Image($r('app.media.WechatIMG24')).width(30).height(30).borderRadius(30)
          Text('song。').margin({ left: 10, right: 10 }).fontWeight(600)
          Image($r('app.media.ic_vip')).width(20).height(20)
        }.flexGrow(1)
        Row() {
          Text('查看我的音乐DNA').fontSize(12).fontColor('#333')
          Image($r('app.media.ic_go')).width(12).height(12)
        }.height('100%')
      }.margin({ bottom: 10 }).height(40)
      Swiper(this.swiperController){
        Image($r('app.media.swiper1')).imgStyle()
        Image($r('app.media.swiper2')).imgStyle()
      }.loop(true).autoPlay(true).interval(3000).borderRadius(10)
      RecommendCom()
      InternalAudio()
    }.height('100%').backgroundColor('#eee').padding(10)
  }
}