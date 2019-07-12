// pages/index/index.js
Page({

  /**
   * 页面的初始数据
   */
  data: {
    canIUse: wx.canIUse('button.open-type.getUserInfo')

  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function (options) {
    var that = this;
    wx.login({
      success: function (res) {
        //console.log(res.code)
        if (res.code) {
          //发起网络请求

          wx.request({
            url: getApp().backurl + "getcode/",
            method: "POST",
            header: {
              "content-type": "application/x-www-form-urlencoded"
            },
            data: {
              code: res.code,

            },
            success: function (result) {
              //console.log(result);
              //把openid放入本地存储
              try {
                wx.setStorageSync('openid', result.data)
              } catch (e) {
                wx.showToast({
                  title: '存储失败',
                  icon: 'success',
                  duration: 800
                })
              }
            }

          })
        } else {
          console.log('登录失败！' + res.errMsg)
        }
      }
    });

  },


  bindGetUserInfo: function (e) {
    if (e.detail.userInfo) {
      //console.log('授权通过')
      //app.globalData.userInfo = e.detail.userInfo;
      wx.reLaunch({
        url: '/pages/salary/salary',
      })
    } else {
      //console.log('拒绝授权')
      wx.reLaunch({
        url: '/pages/salary/salary',
      })
    }
  }
  


})
