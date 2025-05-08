import { global, NavBar, router } from "@free/global";
import { PageFace, RefreshGrid, RefreshUtils } from "@free/refresh";


@Builder
export function systemIconBuilder(o:object){
  NavDestination(){
    SystemIcon()
  }.hideTitleBar(true)
}

router.requestBuilder('systemIcon',wrapBuilder(systemIconBuilder))

export class RefreshModel {
  title: string = "RefreshModel"
  icon: Resource
  constructor(icon:Resource) {
    this.icon = icon
    // this.title = icon.type
  }
}

@Component
export struct SystemIcon{

  dataSource:Array<Resource> = [
    $r('sys.media.ohos_app_icon'),
    $r('sys.media.ohos_ic_back'),
    $r('sys.media.ohos_ic_public_ok'),
    $r('sys.media.ohos_ic_public_arrow_left'),
    $r('sys.media.ohos_ic_public_arrow_right'),
    $r('sys.media.ohos_ic_public_arrow_up'),
    $r('sys.media.ohos_ic_public_arrow_down'),
    $r('sys.media.ohos_ic_public_cut'),
    $r('sys.media.ohos_ic_public_copy'),
    $r('sys.media.ohos_ic_public_paste'),
    $r('sys.media.ohos_ic_public_select_all'),
    $r('sys.media.ohos_ic_public_share'),
    $r('sys.media.ohos_ic_public_translate_c2e'),
    $r('sys.media.ohos_ic_public_search_filled'),
    $r('sys.media.ohos_save_button_filled'),
    $r('sys.media.ohos_save_button_line'),
    $r('sys.media.ohos_ic_bottomsheet_close'),
    $r('sys.media.ohos_ic_public_clock'),
    $r('sys.media.ohos_ic_public_email'),
    $r('sys.media.ohos_ic_public_express'),
    $r('sys.media.ohos_ic_public_flight'),
    $r('sys.media.ohos_ic_public_location'),
    $r('sys.media.ohos_ic_public_phone'),
    $r('sys.media.ohos_ic_public_text'),
    $r('sys.media.ohos_ic_public_web'),
    $r('sys.media.ohos_ic_public_device_matebook'),
    $r('sys.media.ohos_ic_public_device_pad'),
    $r('sys.media.ohos_ic_public_device_smartscreen'),
    $r('sys.media.ohos_ic_public_device_watch'),
    $r('sys.media.ohos_ic_public_device_phone'),
    $r('sys.media.ohos_ic_eco_hop'),
    $r('sys.media.ohos_ic_public_more'),
    $r('sys.media.ohos_ic_public_add'),
    $r('sys.media.ohos_ic_public_minus'),
    $r('sys.media.ohos_ic_public_cast_stream'),
    $r('sys.media.ohos_ic_public_cast_mirror'),
    $r('sys.media.ohos_ic_public_camera'),
    $r('sys.media.ohos_ic_public_cancel'),
    $r('sys.media.ohos_ic_public_hang_up'),
    $r('sys.media.ohos_ic_public_pause'),
    $r('sys.media.ohos_ic_public_play_last'),
    $r('sys.media.ohos_ic_public_play_next'),
    $r('sys.media.ohos_ic_public_play'),
    $r('sys.media.ohos_ic_public_restore'),
    $r('sys.media.ohos_ic_public_sound_off'),
    $r('sys.media.ohos_ic_public_sound'),
    $r('sys.media.ohos_ic_public_video_off'),
    $r('sys.media.ohos_ic_public_video'),
    $r('sys.media.ohos_ic_public_voice_off'),
    $r('sys.media.ohos_ic_public_voice'),
    $r('sys.media.ohos_ic_public_albums'),
    $r('sys.media.ohos_ic_public_scan'),
    $r('sys.media.ohos_ic_public_add_norm_filled'),
    $r('sys.media.ohos_ic_public_remove_filled'),
    $r('sys.media.ohos_ic_public_edit'),
    $r('sys.media.ohos_ic_public_fail'),
    $r('sys.media.ohos_ic_public_close'),
    $r('sys.media.ohos_ic_compnent_titlebar_back'),
    $r('sys.media.ohos_ic_compnent_titlebar_back_filled'),
    $r('sys.media.ohos_ic_public_cancel_filled'),
    $r('sys.media.ohos_ic_public_drawer_close'),
    $r('sys.media.ohos_ic_public_drawer_close_filled'),
    $r('sys.media.ohos_ic_public_drawer_open'),
    $r('sys.media.ohos_ic_public_drawer_open_filled'),
    $r('sys.media.ohos_ic_public_input_cancel'),
    $r('sys.media.ohos_ic_normal_white_grid_zip'),
    $r('sys.media.ohos_ic_normal_white_grid_xml'),
    $r('sys.media.ohos_ic_normal_white_grid_xls'),
    $r('sys.media.ohos_ic_normal_white_grid_wma'),
    $r('sys.media.ohos_ic_normal_white_grid_wav'),
    $r('sys.media.ohos_ic_normal_white_grid_video'),
    $r('sys.media.ohos_ic_normal_white_grid_txt'),
    $r('sys.media.ohos_ic_normal_white_grid_pdf'),
    $r('sys.media.ohos_ic_normal_white_grid_mp3'),
    $r('sys.media.ohos_ic_normal_white_grid_image'),
    $r('sys.media.ohos_ic_normal_white_grid_html'),
    $r('sys.media.ohos_ic_normal_white_grid_folder'),
    $r('sys.media.ohos_ic_normal_white_grid_flac'),
    $r('sys.media.ohos_ic_normal_white_grid_doc'),
    $r('sys.media.ohos_ic_normal_white_grid_compress'),
    $r('sys.media.ohos_ic_normal_white_grid_calendar'),
    $r('sys.media.ohos_ic_normal_white_grid_audio'),
    $r('sys.media.ohos_icon_mask_svg'),
    $r('sys.media.ohos_ic_public_remove'),
    $r('sys.media.ohos_user_auth_icon_face'),
    $r('sys.media.ohos_user_auth_icon_fingerprint'),
    $r('sys.media.ohos_ic_public_device_bluetooth_filled'),
    $r('sys.media.ohos_ic_public_device_earphone_filled'),
    $r('sys.media.ohos_ic_public_device_earpiece_filled'),
    $r('sys.media.ohos_ic_public_device_speaker_filled'),
    $r('sys.media.ohos_ic_public_device_sound_filled'),
    $r('sys.media.ohos_ic_public_device_soundx_filled'),
    $r('sys.media.ohos_ic_public_device_smartscreen_filled'),
    $r('sys.media.ohos_ic_public_ok_filled'),
    $r('sys.media.save_button_picture'),
    $r('sys.media.clone_app_badge_1'),
    $r('sys.media.clone_app_badge_2'),
    $r('sys.media.clone_app_badge_3'),
    $r('sys.media.clone_app_badge_4'),
    $r('sys.media.clone_app_badge_5'),
    $r('sys.media.ic_public_worldclock_filled'),
    $r('sys.media.ic_public_ai_write'),
    $r('sys.media.Copy_Drag'),
    $r('sys.media.Copy_One_Drag'),
    $r('sys.media.Forbid_Drag'),
    $r('sys.media.Forbid_One_Drag'),
    $r('sys.media.Move_Drag'),
    $r('sys.media.safe_volume_notification_icon'),

    $r('sys.media.ohos_app_icon'),
    $r('sys.media.ai_recognize'),
    $r('sys.media.huawei_id_logo_red'),
    $r('sys.media.huawei_id_logo_white'),
    $r('sys.media.huawei_id_logo_red_margin'),
    $r('sys.media.huawei_id_logo_white_margin'),
    $r('sys.media.AI_circle_viewfinder'),
    $r('sys.media.AI_keyboard'),
    $r('sys.media.AI_lightbulb_max'),
    $r('sys.media.AI_panels'),
    $r('sys.media.AI_pause'),
    $r('sys.media.AI_phone'),
    $r('sys.media.AI_phone_doc'),
    $r('sys.media.AI_play'),
    $r('sys.media.AI_playing'),
    $r('sys.media.AI_read_aloud'),
    $r('sys.media.AI_retouch'),
    $r('sys.media.AI_screenshot'),
    $r('sys.media.AI_search'),
    $r('sys.media.AI_subtitles'),
    $r('sys.media.AI_translate'),
    $r('sys.media.AI_translation'),
    $r('sys.media.arrowshape_3_triangle_path'),
    $r('sys.media.balloon_fill'),
    $r('sys.media.battery_bolt_fill'),
    $r('sys.media.calendar_badge_play'),
    $r('sys.media.car_fill'),
    $r('sys.media.Celia'),
    $r('sys.media.Celia_fill'),
    $r('sys.media.cheers'),
    $r('sys.media.cup_fill'),
    $r('sys.media.figure_running'),
    $r('sys.media.fork_knife_fill'),
    $r('sys.media.hobbyhorse_fill'),
    $r('sys.media.lamp_ceiling'),
    $r('sys.media.leave_home_fill'),
    $r('sys.media.light_flashlight_on_fill'),
    $r('sys.media.local_and_figure_run'),
    $r('sys.media.local_and_figure_run_leave'),
    $r('sys.media.media_sound'),
    $r('sys.media.mic_sound'),
    $r('sys.media.moon_z_fill'),
    $r('sys.media.person_badge_waveform'),
    $r('sys.media.person_shield'),
    $r('sys.media.phone_arrow_down_left_circle_fill'),
    $r('sys.media.rectangle_and_line_horizontal_and_rectangle_filled'),
    $r('sys.media.rectangle_filled_and_line_horizontal_and_rectangle'),
    $r('sys.media.return_home_fill'),
    $r('sys.media.textformat_size_square_fill'),
    $r('sys.media.thermometer_fill'),
    $r('sys.media.waveform_folder_fill'),
    $r('sys.media.wifi_router_fill'),
    $r('sys.media.lamp_ceiling_light'),
    $r('sys.media.AI_form'),
    $r('sys.media.ic_public_voice_filled'),
    $r('sys.media.anahs_notification_icon'),
  ]


  @Builder
  itemBuilder(data:object | string,index:number){
    Image(data as string).aspectRatio(1).onClick(()=>{
      AlertDialog.show({message:(data as RefreshModel).icon.id.toString()})
    })
  }
  @Builder
  footerBuilder(){

  }

  /**
   * 刷新
   */
  upData = (page?: PageFace):Promise<boolean | Array<object>> => {
    return new Promise<boolean | Array<object>>((res, rej) => {
      let list:RefreshModel[] = []
      this.dataSource.forEach((e)=>{
        list.push(new RefreshModel(e))
      })
      res(list)
    })
  }

  build() {
    Column(){
      NavBar({title:"系统图标"})
      RefreshGrid({
        itemBuilderParam:this.itemBuilder,
        refresh:new RefreshUtils({data:this.dataSource}),
        footerBuilderParam:this.footerBuilder
      }).height(global.getContentTabBar())
    }
  }
}