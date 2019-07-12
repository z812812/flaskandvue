Page({

  /**
   * 页面的初始数据
   */
  data: {
    details: null,
    title: '完工单明细加载中...',
    page: 1,
    allpage: 1
  },

  onLoad: function(options) {
    var that = this;
    var type = (options.id) ? 'detail' : ''
    //console.log(type)
    wx.request({
      url: getApp().backurl + "querywgd/",
      method: "POST",
      header: {
        "content-type": "application/x-www-form-urlencoded"
      },
      data: {
        openid: wx.getStorageSync('openid'),
        type: type
      },
      success: function(result) {
        //console.log(result)
        if (result.data == 'fail') {
          that.setData({
            title: '查询失败，没有计件数量'
          })
        } else {
          console.log(result)
          var alldetails = result.data
          that.setData({
            len: result.data.length,
            allpage: Math.ceil(result.data.length / 10),
            alldetails: alldetails,
            details: alldetails.slice(0, 10),
            title: type ? '完工单明细' : '完工单合计'
          })
        }

      }

    })

  },
  touchStart: function(e) {
    console.log(e)
    this.setData({
      startX: e.changedTouches[0].clientX,
      startY: e.changedTouches[0].clientY
    })

  },
  touchEnd: function(e) {
    console.log(e)
    let endX = e.changedTouches[0].clientX
    let endY = e.changedTouches[0].clientY
    let startX = this.data.startX
    let startY = this.data.startY
    var allpage = this.data.allpage
    var page = this.data.page
    if (endX - startX < -50 && Math.abs(endY - startY) < 50) {

      if (page < allpage) {
        wx.showToast({
          title: '第' + page + '页共' + allpage + '页',
          duration: 500
        })
        this.setData({
          details: this.data.alldetails.slice(page * 10, (page + 1) * 10),
          page: page + 1
        })
      } else {
        wx.showToast({
          title: '没有了',
        })
      }

     // console.log('左滑')
    } else if (endX - startX > 50 && Math.abs(endY - startY) < 50) {

      if (page != 1) {
        wx.showToast({
          title: '第' + page + '页共'+allpage+'页',
          duration: 500
        })
        this.setData({
          details: this.data.alldetails.slice((page-1) * 10, page  * 10),
          page: page - 1
        })
      } else {
        wx.showToast({
          title: '没有了',
        })
      }
     // console.log('右滑')
    }


  }
})