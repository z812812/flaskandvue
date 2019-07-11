new Vue({
    el: '#app',
    data: {
        use: true,
        id: 2,
        url: 'http://www.baidu.com',
        message: 'it is not my fault'
    },
    methods: {
        dome: function (e) {
            alert('aa');
            console.log(e)

        }
    }
})
