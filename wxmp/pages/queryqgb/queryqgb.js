Page({

  /**
   * 页面的初始数据
   */
  data: {

    details: null,
    title: '请购进度明细加载中...'
  },

  onLoad: function(options) {

    var that = this;
    wx.request({
      url: getApp().backurl + "queryQGD.php",
      url: "https://oa.xinxing999.com/home/zy/",
      method: "POST",
      header: {
        "content-type": "application/x-www-form-urlencoded"
      },
      data: {
        qgdh: options.qgdh,
       //name: "zy",
        //pass:"password"

      },
      success: function(result) {
        console.log(result)
        if (result.data.length == 0) {
          that.setData({
            title: '查询失败，没有该单据'
          })
        } else {
          //console.log(result)
          that.setData({
            details: result.data,
            title: '请购进度表'
          })
        }

      }

    })

  }
})