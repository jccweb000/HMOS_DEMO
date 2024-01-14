import { ConsumeComponent } from './components/ConsumeComponent';

export class Info {
  name: string;
  age: number;
}

@Entry
@Component
struct ProviderPage {
  @Provide info: Info = { name: '吴彦祖', age: 20 };
  // 别名
  @Provide aliasInfo: Info = { name: '陈冠希', age: 18 }

  build() {
    Row() {
      Column() {
        ConsumeComponent()
      }
      .width('100%')
    }
    .height('100%')
  }
}