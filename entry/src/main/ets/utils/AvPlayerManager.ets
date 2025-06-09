import { media } from '@kit.MediaKit'
import { SongItemType } from '../models/Music';

class AvPlayerManager{
  player:media.AVPlayer|null=null;
  async  init(){
    if(!this.player){
      this.player = await media.createAVPlayer()
    }
    this.player.on("stateChange",(state:media.AVPlayerState)=>{
      if (state === "initialized") {
        this.player?.prepare()
      }else if (state==="prepared"){
        this.player?.play();
      }
    })
  }
  //播放歌曲
  singPlay(song:SongItemType){
    this.player!.url=song.url
  }
}
export  const playerManager:AvPlayerManager=new AvPlayerManager()