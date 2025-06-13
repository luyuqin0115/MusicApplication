import { media } from '@kit.MediaKit'
import { GlobalMusic } from '../models/GlobalMusic';
import { SongItemType } from '../models/Music';
import { AppStorageV2 } from '@kit.ArkUI';
import { url } from '@kit.ArkTS';
import { avSessionManager } from './AvSessionManager';

class AvPlayerManager{
  player:media.AVPlayer|null=null;

  currentSong:GlobalMusic = AppStorageV2.connect(GlobalMusic,'SONG_KEY',()=>new GlobalMusic())!
  async  init(){
    if(!this.player){
      this.player = await media.createAVPlayer()
    }
    this.player.on("stateChange",(state:media.AVPlayerState)=>{
      if (state === "initialized") {
        this.player?.prepare()
      }else if (state==="prepared"){
        this.player?.play();
        this.currentSong.isPlay = true
      }else if (state==='completed'){
        this.nextPlay(true)
      }else if ((state==='released')){
        this.player?.reset()
      }
    })
    this.player.on('durationUpdate',(duration)=>{
      this.currentSong.duration=duration
      avSessionManager.setAVMetadata(this.currentSong.playList[this.currentSong.playIndex])
    })
    this.player.on('timeUpdate',(time)=>{
      this.currentSong.time=time
      avSessionManager.setAVPlayBackState()
    })
  }
  //播放歌曲
  singPlay(song:SongItemType){
    //需要申请长时任务
    avSessionManager.startBackgroundTask()
    avSessionManager.setAVPlayBackState()
    const inList = this.currentSong.playList.some(item=>item.id===song.id)
    if (inList) {
      if (this.currentSong.url===song.url) {
        this.player?.play()
        this.currentSong.isPlay = true
      }else {
        this.currentSong.playIndex=this.currentSong.playList.findIndex(item=>item.id===song.id)
        this.changeSong()
      }

    }else {
      this.currentSong.playList.unshift(song)
      this.currentSong.playIndex=0
      this.changeSong()
    }
  }
  //  切换歌曲
  async  changeSong(){
    await this.player?.reset()


    this.currentSong.img=this.currentSong.playList[this.currentSong.playIndex].img
    this.currentSong.name=this.currentSong.playList[this.currentSong.playIndex].name
    this.currentSong.author=this.currentSong.playList[this.currentSong.playIndex].author
    this.currentSong.url=this.currentSong.playList[this.currentSong.playIndex].url
    this.currentSong.time = 0
    this.currentSong.duration = 0
    this.player!.url=this.currentSong.url
  }
  //定义跳转进度
  seekPlay(value : number){
    this.player?.seek(value)
  }

  paused(){
    this.player?.pause()
    this.currentSong.isPlay=false
    avSessionManager.setAVPlayBackState()
  }
  prevPlay(){
    if (this.currentSong.playMode==='random'){
      //随机
      this.currentSong.playIndex=Math.floor(Math.random()*this.currentSong.playList.length)
    }else{
      this.currentSong.playIndex--
      if (this.currentSong.playIndex < 0) {
        this.currentSong.playIndex=this.currentSong.playList.length-1
      }
    }
    this.singPlay(this.currentSong.playList[this.currentSong.playIndex])

  }
  nextPlay(autoNextPlay?:boolean){
    if (this.currentSong.playMode==='repeat'){
      //重复
      this.currentSong.playIndex=this.currentSong.playIndex
    }else if (this.currentSong.playMode==='random'){
      //随机
      this.currentSong.playIndex=Math.floor(Math.random()*this.currentSong.playList.length)
    }else {
      //列表
      this.currentSong.playIndex++
      if (this.currentSong.playIndex >= this.currentSong.playList.length) {
        this.currentSong.playIndex=0
      }
    }
    this.singPlay(this.currentSong.playList[this.currentSong.playIndex])
  }

  //列表移除
  removeSong(index:number,pathStack:NavPathStack){
    if (index ===this.currentSong.playIndex) {
      if (this.currentSong.playList.length>1) {
        this.currentSong.playList.splice(index,1)
        if (this.currentSong.playIndex>=this.currentSong.playList.length) {
          this.currentSong.playIndex=0
        }
        this.singPlay(this.currentSong.playList[this.currentSong.playIndex])
      }else {
        this.currentSong.reset()
        this.player?.reset()
        pathStack.pop()
      }
    }else {
      if (index<this.currentSong.playIndex) {
        this.currentSong.playIndex--
      }
      this.currentSong.playList.splice(index,1)
    }
  }
  //释放播放器
  async  release(){
    await this.player?.release()
  }
}
export  const playerManager:AvPlayerManager=new AvPlayerManager()