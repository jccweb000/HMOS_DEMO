import router from '@ohos.router';

import { Music, MusicType } from './types/index';
import { musicList } from './data/mock';

@Entry
@Component
struct MusicPage {
  @State list: Music[] = [];

  onPageShow() {
    this.list = musicList;
  }

  toMusicDetail (id: string) {
    router.pushUrl({
      url: 'pages/MusicDetail',
      params: { id }
    })
  }

  @Styles imgStyles () {
    .width(80).height('100%').margin({ right: 10 }).borderRadius(10)
  }

  @Builder
  renderImg (src?: Resource) {
    if (!src) {
      Image('')
        .imgStyles()
    } else {
      Image(src)
        .imgStyles()
    }
  }

  build() {
    Flex({ direction: FlexDirection.Column }) {
      Text('歌曲列表').width('100%').textAlign(TextAlign.Center).margin({ bottom: 10 }).fontSize(20).fontWeight(600)
      Scroll() {
        List() {
          ForEach(this.list, (item: Music) => {
            ListItem() {
              Flex({ alignItems: ItemAlign.Center }) {
                this.renderImg(item.coverImg)
                Flex({direction: FlexDirection.Column}) {
                  Flex({ justifyContent: FlexAlign.SpaceBetween }) {
                    Text(item.name).fontSize(20).fontWeight(600)
                    if (item.type === MusicType.vip) {
                      Text('会员').backgroundColor(Color.Orange).padding(5).fontColor(Color.White).borderRadius(4).margin({ top: 2 })
                    }
                  }
                  Text(item.author).fontSize(16).fontColor('#ccc')
                }.flexGrow(1)
              }.padding(10).width('100%')
            }.width('100%').height(80).borderRadius(10).shadow({ radius: 6, color: '#361a1919', offsetX: 2, offsetY: 2 })
            .onClick(() => this.toMusicDetail(item.id))
          }, (music: Music) => music.id)
        }.height('100%').padding(10)
      }.flexGrow(1)
    }.width('100%').height('100%').padding({ top: 20 })
  }
}