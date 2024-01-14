import { Music, MusicType } from '../types/index';

export const musicList: Music[] = [
  {
    id: 'music_1',
    type: MusicType.vip,
    author: '周杰伦',
    name: '花海',
    src: $rawfile('dynamic.wav'),
    coverImg: $r('app.media.ic_avatar1'),
    comments: [
      {
        user: '李四',
        content: '666'
      }
    ]
  },
  {
    id: 'music_2',
    type: MusicType.vip,
    author: '周杰伦',
    name: '安静',
    src: $rawfile('dynamic.wav'),
    coverImg: $r('app.media.ic_avatar2'),
    comments: [
      {
        user: '张三',
        content: 'nice！'
      },
      {
        user: '李四',
        content: '666'
      }
    ]
  },
  {
    id: 'music_3',
    type: MusicType.normal,
    author: '薛之谦',
    name: '陪你去流浪',
    src: $rawfile('dynamic.wav'),
    coverImg: $r('app.media.ic_avatar3'),
    comments: [
      {
        user: '李四',
        content: 'xs'
      },
    ]
  },
  {
    id: 'music_4',
    type: MusicType.normal,
    author: '薛之谦',
    name: '演员',
    src: $rawfile('dynamic.wav'),
    coverImg: $r('app.media.ic_avatar4'),
    comments: [
      {
        user: '李四',
        content: 'xs'
      },
    ]
  },
  {
    id: 'music_5',
    type: MusicType.normal,
    author: '林宥嘉',
    name: '说谎',
    src: $rawfile('dynamic.wav'),
    coverImg: $r('app.media.ic_avatar5'),
    comments: [
      {
        user: '李四',
        content: 'xs'
      },
    ]
  },
  {
    id: 'music_6',
    type: MusicType.normal,
    author: '蔡徐坤',
    name: '只因你太美',
    src: $rawfile('dynamic.wav'),
    coverImg: $r('app.media.ic_avatar6'),
    comments: [
      {
        user: '李四',
        content: 'xs'
      },
    ]
  },
  {
    id: 'music_7',
    type: MusicType.normal,
    author: '邓紫棋',
    name: '泡沫',
    src: $rawfile('dynamic.wav'),
    coverImg: $r('app.media.ic_avatar7'),
    comments: [
      {
        user: '李四',
        content: 'xs'
      },
    ]
  },
  {
    id: 'music_8',
    type: MusicType.normal,
    author: '林宥嘉',
    name: '你是我的眼',
    src: $rawfile('dynamic.wav'),
    coverImg: $r('app.media.ic_avatar8'),
    comments: [
      {
        user: '李四',
        content: 'xs'
      },
    ]
  },
  {
    id: 'music_9',
    type: MusicType.normal,
    author: '凤凰传奇',
    name: '最炫民族风',
    src: $rawfile('dynamic.wav'),
    coverImg: $r('app.media.ic_avatar9'),
    comments: [
      {
        user: '李四',
        content: 'xs'
      },
    ]
  },
]

export const getRecommendList = () => {
  const list: Music[][] = [];
  musicList.forEach((item, index) => {
    const idx = Math.floor(index / 4);
    if (list[idx]) {
      list[idx].push(item);
    } else {
      list[idx] = [item];
    }
  })
  return list;
}
