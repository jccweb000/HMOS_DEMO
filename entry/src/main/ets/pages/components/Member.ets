import { Member } from '../ObservedPage';

@Component
export struct MemberView {
  @ObjectLink member: Member;

  build() {
    Column() {
      Text(`名字： ${this.member.name}`).margin(10)
      Text(`年龄： ${this.member.age}`)
    }
  }
}