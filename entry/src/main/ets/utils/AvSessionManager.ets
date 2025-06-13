import { avSession as AVSessionManager} from '@kit.AVSessionKit';
import { backgroundTaskManager } from '@kit.BackgroundTasksKit';
import { wantAgent } from '@kit.AbilityKit';
import { GlobalMusic } from '../models/GlobalMusic';
import { AppStorageV2 } from '@kit.ArkUI';
import { SongItemType } from '../models/Music';
import { BusinessError } from '@kit.BasicServicesKit';
import { playerManager } from './AvPlayerManager';

class AvSessionManager{
  // await AVSessionManager.createAVSession(context, 'SESSION_NAME', type);
  session :AVSessionManager.AVSession|null=null
  playState:GlobalMusic = AppStorageV2.connect(GlobalMusic,'SONG_KEY',()=>new GlobalMusic())!


  async  init(context:Context ){
    this.session =await AVSessionManager.createAVSession(context, 'bg_play', 'audio');
    this.registerEvent()
  }
  //申请长时任务
 async  startBackgroundTask(){
    let wantAgentInfo: wantAgent.WantAgentInfo = {
      wants: [
        {
          bundleName: "com.example.musicapplication",
          abilityName: "EntryAbility"
        }
      ],
      actionType: wantAgent.OperationType.START_ABILITY,
      requestCode: 0,
      actionFlags: [wantAgent.WantAgentFlags.UPDATE_PRESENT_FLAG],
    };
    const wantAgentObj =await wantAgent.getWantAgent(wantAgentInfo)
    backgroundTaskManager.startBackgroundRunning(getContext(), backgroundTaskManager.BackgroundMode.AUDIO_PLAYBACK, wantAgentObj)
  }
  //设置元数据
  setAVMetadata(song:SongItemType){
    // 设置必要的媒体信息。
    let metadata: AVSessionManager.AVMetadata = {
      assetId: song.id, // 由应用指定，用于标识应用媒体库里的媒体。
      title: song.name,
      mediaImage: song.img,
      artist: song.author,
      duration:this.playState.duration
    };
    this.session?.setAVMetadata(metadata).then(() => {
      console.info(`SetAVMetadata successfully`);
    }).catch((err: BusinessError) => {
      console.error(`Failed to set AVMetadata. Code: ${err.code}, message: ${err.message}`);
    });

  }
  setAVPlayBackState(){
    // 简单设置一个播放状态 - 暂停 未收藏。
    let playbackState: AVSessionManager.AVPlaybackState = {
      state: this.playState.isPlay? AVSessionManager.PlaybackState.PLAYBACK_STATE_PLAY: AVSessionManager.PlaybackState.PLAYBACK_STATE_PAUSE,
      isFavorite: false,
      speed:1,
      position:{
        elapsedTime:this.playState.time,
        updateTime:new Date().getTime()
      },
      duration:this.playState.duration

    };
    this.session?.setAVPlaybackState(playbackState, (err: BusinessError) => {
      if (err) {
        console.error(`Failed to set AVPlaybackState. Code: ${err.code}, message: ${err.message}`);
      } else {
        console.info(`SetAVPlaybackState successfully`);
      }
    });
  }

  //注册事件
  registerEvent(){
    this.session?.on("play",()=>{
      playerManager.singPlay(this.playState.playList[this.playState.playIndex])
    })
    this.session?.on("pause",()=>{
      playerManager.paused()
    })
    this.session?.on("playNext",()=>{
      playerManager.nextPlay()
    })
    this.session?.on("playPrevious",()=>{
      playerManager.prevPlay()
    })
    this.session?.on("seek",(value:number)=>{
      playerManager.seekPlay(value)
    })
    this.session?.activate()
  }

  //注销会话
  async destroy(){
    await this.session?.destroy()
  }
}
export  const  avSessionManager :AvSessionManager = new AvSessionManager()