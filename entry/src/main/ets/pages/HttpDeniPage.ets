
import http from '@ohos.net.http'

@Entry
@Component
struct HttpDeniPage {
  @State message: string = 'Hello World';


  getData () {
    console.log('111111')
    let httpRequest = http.createHttp();

    httpRequest.request('https://api.apiopen.top/api/sentences', {
      method: http.RequestMethod.GET
    }, (err, data) => {
      if (!err) {
        console.log('222')
        console.log(JSON.stringify(data))
        this.message = JSON.parse(`${data.result}`).result.name;
      } else {
        console.log('err', err)
      }

    })
  }

  build() {
    Row() {
      Column() {
        Text(this.message)
          .fontSize(50)
          .fontWeight(FontWeight.Bold)
          .onClick(() => this.getData())
      }
      .width('100%')
    }
    .height('100%')
  }
}