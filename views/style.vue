var user = new Vue({
    el:'#user',
    data: {
     },
     methods: {
        handlesubmit(e){
            console.log(e)
        }
    }
})

var title = new Vue({
        el: '#title',
        data: {
            textTitle: 'SIGN UP',
        },
        methods: {
            setTitle: function() {
                return {
                    fontSize: '3rem',
                }
            }
        }
})

new Vue({
    el: 'h3',
    methods: {
        setH3: function(){
            return {
                fontWeight: 'lighter',
            }
        }
        
    }
})
new Vue({
    el: '#investor',
    data: {
        color: 'gray',
        width: '100px',
        height: '100px'
    },
    computed: {
        setBody: function() {
            return{
                backgroundColor: '#283149',
                width: '100%',
                height: '100%',
                border: 'none',
                borderRadius: '20px',
                textAlign: 'center',
                padding: '15% auto 5% auto',
            }
        },
        setBody2: function(){
            return {
                backgroundColor: 'white',
                width: '70%',
                height: '300px',
                border: 'none',
                borderRadius: '20px',
            }
        },
        customText: function() {
            return {
                color: 'white',
                fontSize: '6rem',
                textShadow: '3px 0 rgb(243,76,71)',
            }
        },
        hrStyle: function() {
            return {
                border: 'dotted #DBEDF3 10px',
                borderBottom: 'none',
                width: '10%',
                margin: '100px auto 50px auto',
            }
        },
    }
})

new Vue({
    el:'#detail',
    computed: {
        styleText: function() {
            return {
                color: 'white',
                fontSize: '6rem',
                textShadow: '3px 0 rgb(243,76,71)',
            }
        },
        setBody: function() {
            return {
                backgroundColor: '#283149',
                width: '100%',
                height: '100%',
                border: 'none',
                borderRadius: '20px',
                textAlign: 'center',
                padding: '5% auto 5% auto',
            }
        },
        setH3: function() {
            return {
                color: 'white',
                fontSize: '2rem',
                textShadow: '2px 0 black',
            }
        },
        setInput: function(){
            return {
                width: '90%',
                height: '200px',
            }
        }
    }
})

new Vue({
    el: '#proj',
    data: {
        color: 'brown',
        fontSize: '6rem',
    },
    methods: {
        setBody1: function() {
            return {
                backgroundColor: '#283149',
                width: '100%',
                height: '100%',
                border: 'none',
                borderRadius: '20px',
                textAlign: 'center',
            }
        },
        setBody2: function(){
            return {
                backgroundColor: 'white',
                width: '70%',
                height: '300px',
                border: 'none',
                borderRadius: '20px',
            }
        },
        styleText1: function() {
            return {
                color: 'white',
                fontSize: '6rem',
                textShadow: '3px 0 rgb(243,76,71)',
            }
        },
        hrStyle: function() {
            return {
                border: 'dotted #DBEDF3 10px',
                borderBottom: 'none',
                width: '10%',
                margin: '100px auto 50px auto',
            }
        },
        logOut: function(){
            return {
                position: 'absolute',
                right: '20px',
                top: '20px',
            }
        }
    }
})

