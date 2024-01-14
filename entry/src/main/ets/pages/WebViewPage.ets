import webview from '@ohos.web.webview';

@Entry
@Component
struct WebViewPage {
  @State message: string = 'Hello World';
  myControl: WebviewController = new webview.WebviewController();

  build() {
    Row() {
      Column() {
        Web({
          src: 'https://www.lodashjs.com/docs/lodash.merge#_mergeobject-sources',
          controller: this.myControl
        })
      }
      .width('100%')
    }
    .height('100%')
  }
}