import { MemberView } from './components/Member';
import { Music, MusicType } from './types/index';
import { musicList } from './data/mock';

@Observed
export class Member {
  name: string;
  age?: number;

  constructor(name: string, age?: number) {
    this.name = name;
    this.age = age;
  }
}

class StoreInfo {
  address: string;
  storeName: string;
}

class GoodsInfo {
  name: string;
  price: string;
}
// 应用类型属性为引用类型时，该属性也需要被Observed
@Observed
export class Store {
  info: StoreInfo;
  goods?: GoodsInfo[];

  constructor(info: StoreInfo, goods?: GoodsInfo[]) {
    this.info = info;
    this.goods = goods;
  }
}

@Entry
@Component
struct ObservedPage {
  @State members: Member[] = [new Member('吴彦祖', 18), new Member('陈冠希', 20)];
  @State storeList: Store[] = [new Store({ storeName: '全家', address: '徐家汇' })];
  @State musics: Music[] = [];

  onPageShow() {
    this.musics = musicList;
  }

  addMusic () {
    const newMusic = {
      id: Math.random().toString(),
      type: MusicType.vip,
      author: '不知名',
      name: '新增的歌曲',
      src: $rawfile('dynamic.wav')
    }
    this.musics = [...this.musics, newMusic]
  }

  build(){
    Flex({direction: FlexDirection.Column}){
      Text('观察对象嵌套')
      Button('加一个员工')
        .onClick(() => {
          const newList = [...this.members, new Member('无名', 20)]
          this.members = newList;
        })
      Scroll() {
        Flex({ direction: FlexDirection.Column }) {
          ForEach(this.members, (member, idx) => {
            Row() {
              Text((idx + 1).toString())
              MemberView({ member: member })
            }.backgroundColor('#eee').margin({ bottom: 10 }).height(100).width('100%').borderRadius(10).padding(10)
          }, (member, idx) => idx + JSON.stringify(member))
        }.padding({ left: 10, right: 10 }).width('100%')
      }.height(300).width('100%')
      Divider().strokeWidth(3)
      Button('发布一首')
      .onClick(() => this.addMusic())
      List({ space: 10 }) {
        ForEach(this.musics, (music: Music) => {
          ListItem() {
            Flex(){
              Image($r('app.media.icon')).width(60).height(60).margin({ right: 10 })
              Column({ space: 5 }) {
                Text() {
                  Span('歌手:').margin({ right: 5 })
                  Span(music.author)
                }
                if (music.type === MusicType.vip) {
                  Text('会员').fontColor(Color.Orange)
                }
              }.backgroundColor('#eee').padding(10).flexGrow(1).height('100%').alignItems(HorizontalAlign.Start).justifyContent(FlexAlign.Start)
            }.width('100%').height('100%')
          }.width('100%').height(60)
        }, (music: Music) => music.id)
      }.width('100%').height(500).padding(10)
    }.height('100%').width('100%')
  }
}