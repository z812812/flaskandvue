new Vue({
    delimiters: ["[[", "]]"],
    el: '#app',
    data:{
        mys:'sb',
        da:[
            'gg','ll','kk','pp'
        ]
    },
    methods:{
        change:function () {
            alert("你是sb吗")
        }
    }

})
