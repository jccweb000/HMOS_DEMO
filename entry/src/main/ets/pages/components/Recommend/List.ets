import { getRecommendList } from '../../data/mock';
import { Music, MusicType } from '../../types/index';

@Component
export struct RecommendList {
  @State music: Music[][] = getRecommendList();
  private swiperController: SwiperController = new SwiperController();

  build() {
    Swiper(this.swiperController) {
      ForEach(this.music, (group: Music[]) => {
        Flex({ direction: FlexDirection.Column }) {
          ForEach(group, (item: Music) => {
            Flex() {
              Image(item.coverImg).width(80).height(80).borderRadius(10).margin({ right: 10 })
              Flex({ direction: FlexDirection.Column, justifyContent: FlexAlign.Center  }) {
                Text(item.name).margin({ bottom: 10 }).fontWeight(600).fontSize(18)
                Row({ space: 10 }) {
                  Text(item.author).fontSize(14)
                  if (item.type === MusicType.vip) {
                    Image($r('app.media.ic_music_vip')).width(16).height(16)
                  }
                }
              }.height('100%')
            }.height(80).margin({ bottom: 10 })
          })
        }.width('95%')
      })
    }.width('100%').displayMode(SwiperDisplayMode.AutoLinear)
    .indicator(false)
  }
}