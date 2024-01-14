import { Comment } from '../types/index';

@Component
export struct CommentItem {
  @Prop content: string;
  @Prop user: string;

  build() {
    Flex({ justifyContent: FlexAlign.SpaceBetween}) {
      Text(this.content)
      Text(this.user)
    }.width('100%').padding(10).border({ width: 1, color: '#ccc', radius: 10 })
  }
}