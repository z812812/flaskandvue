var videoAd = null
var interstitialAd = null
Page({

  /**
   * 页面的初始数据
   */
  data: {
    
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function(options) {
    if (wx.createRewardedVideoAd) {
      // 加载激励视频广告
      videoAd = wx.createRewardedVideoAd({
        adUnitId: 'adunit-41872b4d225c2491'
      })
      //捕捉错误
      videoAd.onError(err => {
        // 进行适当的提示
      })
      // 监听关闭
      videoAd.onClose((status) => {
        if (status && status.isEnded || status === undefined) {
          // 正常播放结束，下发奖励
          // continue you code
          wx.navigateTo({
            url: '../ranklist/ranklist',
          })
          console.log('正常')
        } else {
          // 播放中途退出，进行提示
          wx.showToast({
            title: '请观看完毕',
          })
          
        }
      })
    }
  },
  onReady: function(o) {
    if (wx.createInterstitialAd) {
      interstitialAd = wx.createInterstitialAd({
        adUnitId: 'adunit-8d69c5541cd318f7'
      })
      interstitialAd.onError(err => {
        console.log('加载出错')
      })
      interstitialAd.onClose((status) => {
        if (status && status.isEnded || status === undefined) {
          // 正常播放结束，下发奖励
          // continue you code
          wx.navigateTo({
            url: '../ranklist/ranklist',
          })
        } else {
          // 播放中途退出，进行提示
         wx.showToast({
           title: '请观看完毕',
         })
        }
      })
    }
    wx.showShareMenu({
      withShareTicket: true
    })
  },
  //完工单查询跳转
  wgdQuery: function() {
    wx.navigateTo({
      url: '../wgdQuery/wgdQuery?id=1',
    })
  },
  wgd_sum_query: function() {
    wx.navigateTo({
      url: '../wgdQuery/wgdQuery',
    })
  },
  bindGetInputValues: function(event) {
    //console.log(event),
    this.setData({
      inputValues: event.detail.value
    })
  },
  //请购单查询跳转
 
  //排行榜查询
  
  adm: function () {
    if (videoAd) {
      videoAd.show().catch(() => {
        // 失败重试
        videoAd.load()
          .then(() => videoAd.show())
          .catch(err => {
            console.log(err)
          })
      })
    }
  },
  adc: function () {
    if (interstitialAd) {
      interstitialAd.show().catch((err) => {
        console.error(err)
      })
    }
  },




})