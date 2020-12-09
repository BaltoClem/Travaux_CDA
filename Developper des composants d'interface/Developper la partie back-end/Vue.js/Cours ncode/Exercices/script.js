// Déclarations d'une nouvelle appli
var sum = new Vue({
    el: '#app',
    data: {
        // Déclaration des variables utilisées
        firstNumber: '',
        secondNumber: '',
        result: ''
    },
    methods: {
        addition: function (evt) {
            console.log(firstNumber.value);
            console.log(secondNumber.value);
            this.result = parseInt(firstNumber.value) + parseInt(secondNumber.value);
        }
    }
});    