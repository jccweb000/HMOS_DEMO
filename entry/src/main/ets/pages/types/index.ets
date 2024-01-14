export enum MusicType {
  'normal' = 'normal',
  'vip' = 'vip'
}

@Observed
export class Comment {
  user: string;
  content: string;
}

@Observed
export class Music {
  id: string;
  type: MusicType;
  author: string;
  name: string;
  src: Resource;
  coverImg?: Resource;
  comments?: Comment[]
}