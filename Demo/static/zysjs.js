new Vue({
    delimiters: ["[[", "]]"],
    el: '#app',
    data: {
        iphones: [{
            id: 1,
            name: 'iphone 8',
            price: 5099,
            count: 1
        },
            {
                id: 2,
                name: 'iphone xs',
                price: 8699,
                count: 1
            },
            {
                id: 3,
                name: 'iphone xr',
                price: 6499,
                count: 1
            }]
    },
    watch: {
        ten: function (val) {
            this.ten = val;
            this.one = val * 10
        },
        one: function (val) {
            this.ten = val / 10;
            this.one = val
        }
    }
})
