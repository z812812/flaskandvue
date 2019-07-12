Page({

  /**
   * 页面的初始数据
   */
  data: {
    gz:"查询中...",
    qty:'查询中...'
  },

  /**
   * 生命周期函数--监听页面加载
   */

  onLoad: function(options) {
    var that=this
    wx: wx.request({
      url: getApp().backurl + "sumgz/",
      method: "POST",
      header: {
        "content-type": "application/x-www-form-urlencoded"
      },
      data: {
        openid: wx.getStorageSync('openid')
      },
      success: function (res) {
        var sumgz=res.data[0].sumgz
        var sumqty=res.data[0].sumqty
        var gz = (Math.ceil(sumgz/100))*100
        that.setData({
          gz:gz,
          qty:sumqty
        })
      },
      fail: function (res) { },
      complete: function (res) { },
    })
  },

  /**
   * 生命周期函数--监听页面初次渲染完成
   */
  onReady: function() {

    wx.showShareMenu({
      withShareTicket: true
    })
  },

  /**
   * 生命周期函数--监听页面显示
   */
  onShow: function() {

  },

  /**
   * 生命周期函数--监听页面隐藏
   */
  onHide: function() {

  },

  /**
   * 生命周期函数--监听页面卸载
   */
  onUnload: function() {
    
  },

  /**
   * 页面相关事件处理函数--监听用户下拉动作
   */
  onPullDownRefresh: function() {

  },

  /**
   * 页面上拉触底事件的处理函数
   */
  onReachBottom: function() {

  },

  /**
   * 用户点击右上角分享
   */
  onShareAppMessage: function() {

  },




})