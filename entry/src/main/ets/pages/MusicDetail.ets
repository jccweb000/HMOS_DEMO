import router from '@ohos.router';

import { Header } from './components/Header';
import { Music, Comment } from './types/index';
import { musicList } from './data/mock';
import { CommentItem } from './components/CommentItem';
const musicId = router.getParams()['id'] as string;

@Entry
@Component
struct MusicDetail {
  params = router.getParams();
  @State music: Music = musicList.find(item => item.id === musicId);

  onPageShow() {
    console.log(JSON.stringify(this.music.comments))
  }

  build() {
    Column(){
      Flex({ direction: FlexDirection.Column }) {
        if (this.music) {
          Header({ title: this.music.name as string })
          Flex({ direction: FlexDirection.Column }) {
            Image(this.music.coverImg)
              .width('100%').objectFit(ImageFit.Fill)
            Text('精选评论').margin({ top: 10 }).fontSize(20).fontWeight(600).margin({ top: 10, bottom: 10 }).padding(10)
            if (this.music.comments) {
              List({ space: 10 }) {
                ForEach(this.music.comments, (item: Comment) => {
                  ListItem(){
                    CommentItem({ content: item.content as string, user: item.user as string })
                  }
                }, (item: Comment, idx) => item.user + item.content + idx)
              }.width('100%').padding(20).flexGrow(1)
            }
          }.flexGrow(1).width('100%').align(Alignment.TopEnd).height('100%')
        }
      }.width('100%').height('90%')
      Column() {
        Text('position')
        Button('播放音乐')
      }.position({ x: 0, y: '90%'}).width('100%').height(100).backgroundColor(Color.Pink).zIndex(1000)
      .visibility(Visibility.Visible)
    }

  }
}