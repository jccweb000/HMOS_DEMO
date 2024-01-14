// 按引用传递
@Builder
export function CreateText ($$: { name: string }) {
  Text($$.name)
}
// 按值传递
@Builder function StaticText(name: string) {
  // 状态变量的更改不会引起Builder的Ui更新
  Text(name)
}

@Entry
@Component
struct BuilderPage {
  @State message: string = 'Hello World'

  @Builder renderTextWithColor () {
    Text('带有红色的text文本').fontColor(Color.Red)
  }

  // 错误的示范 => 没有使用Builder修饰的方法
  renderTextWithFontSize () {
    // Text('错误示范').fontSize(50);
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
        this.renderTextWithColor()
        // this.renderTextWithFontSize()
        CreateText({ name: '按引用传递' })
        StaticText('按值传递')
      }
      .width('100%')
    }
    .height('100%')
  }
}