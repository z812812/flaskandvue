Page({

  /**
   * 页面的初始数据
   */
  data: {
    avatarUrl: '头像',
    nickName: '昵称',
    province: '省份',
    city: '城市',
    bbs_title:null,
    bbs_content:null
  },

  /**
   * 生命周期函数--监听页面加载
   */
  onLoad: function(options) {
    var that = this;
    wx.getSetting({
      success: function(res) {
        if (res.authSetting['scope.userInfo']) {
          // 已经授权，可以直接调用 getUserInfo 获取头像昵称
          wx.getUserInfo({
            success: function(res) {
              //console.log(res.userInfo)
              //设置数据
              that.setData({
                avatarUrl: res.userInfo.avatarUrl,
                nickName: res.userInfo.nickName,
                province: res.userInfo.province,
                city: res.userInfo.city
              })
              //发起网络请求，请求明细


            }
          })
        }
      }
    })
  },

  formSubmit: function(e) {
    var personid = e.detail.value.personid
    var that =this
    try {
      var openid=wx.getStorageSync('openid')
    } catch (e) {
      wx.showToast({
        title: '存储失败',
        icon: 'success',
        duration: 800
      })
    }
    //console.log(personid)
    //把身份证和openid绑定
    wx.request({
      url: getApp().backurl + "getid/",
      method: "POST",
      header: {
        "content-type": "application/x-www-form-urlencoded"
      },
      data: {
        personid: personid,
        openid: openid

      },
      success: function(result) {
        that.setData({
          deta: result.data
        });
        if (result.data == 'success') {
          wx.showToast({
            title: '绑定成功',
            icon: 'success',
            duration: 2000
          })
        } else if (result.data == 'fail') {
          wx.showToast({
            title: '请正确输入身份证号',
            icon: 'success',
            duration: 2000
          })
        } else if (result.data == 'fail1') {
          wx.showToast({
            title: '绑定失败，重新绑定',
            icon: 'success',
            duration: 2000
          })
        } else {
          wx.showToast({
            title: '已绑定过',
            icon: 'success',
            duration: 2000
          })
        }

      }

    })
  },
  bbs:function(){
    wx.navigateTo({
      url: '../bbs/bbs'
    })
  }


})