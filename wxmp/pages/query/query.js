Page({

  /**
   * 页面的初始数据
   */
  data: {
    title: '工资明细加载中'
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function(options) {
    var that = this;
    wx.request({
      url: getApp().backurl + "querysalary/",
      method: "POST",
      header: {
        "content-type": "application/x-www-form-urlencoded"
      },
      data: {
        openid: wx.getStorageSync('openid'),

      },
      success: function(result) {
        that.setData({
          details: result.data,
          title: '工资明细'
        })
      }

    })
  },
  //点击刷新
  refreshdata: function(e) {
    var that = this
    wx.request({
      url: getApp().backurl + "querysalary/",
      method: 'post',
      header: {
        "content-type": "application/x-www-form-urlencoded"
      },
      data: {
        openid: wx.getStorageSync('openid')
      },
      success: function(result) {
        console.log(result)
        that.setData({
          details: result.data,
          title: '工资明细'
        })
      }
    })
  }
})