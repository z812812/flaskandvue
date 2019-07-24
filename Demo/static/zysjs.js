var vm = new Vue({
    delimiters: ["[[", "]]"],
    el: '#app',
    data: {
        name: null,
        age: null,
        dis: true,
        output: '这里'
    },
    methods: {
        oo(e) {
            console.log(e)
            document.getElementById('oo').value = 'sdflskdfj'
        },
        // getFile(event) {
        //     this.file = event.target.files[0];
        //     console.log(this.file)
        // },
        aa(event) {
            //创建 formData 对象
            console.log(event)
            let formData = new FormData();
            // 向 formData 对象中添加文件
            formData.append('name', this.name);
            formData.append('age', this.age);
            formData.append('file', document.getElementById('file').files[0]);
            var option = {
                url: '/upload/',
                method: 'post',
                data: formData
            }
            var that = this
            axios(option)
                .then(function (response) {
                    console.log(response);
                    that.dis = false
                    document.getElementById('oo').innerText='我也成功了'
                    that.output = response.data
                })
                .catch(function (error) {
                    console.log(error);
                });

        },
    }

})

