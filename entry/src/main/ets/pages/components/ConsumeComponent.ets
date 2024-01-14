import { Info } from '../ProviderPage';

@Component
export struct ConsumeComponent {
  @Consume info: Info;
  @Consume('aliasInfo') myInfo: Info;

  build () {
    Column() {
      Text(this.info.name)
      Text(this.info.age?.toString())
      Divider().margin(10)
      Text(this.myInfo.name)
      Text(`${this.myInfo.age}`)
    }
  }
}