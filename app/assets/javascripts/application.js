// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, or any plugin's
// vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file. JavaScript code in this file should be added after the last require_* statement.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require rails-ujs
//= require activestorage
//= require jquery
//= require cocoon
//= require materialize-sprockets
//= require_tree .
$(document).ready(function() {
    $('textarea').addClass('materialize-textarea')
    var field_number = 1;
    $('select').material_select();
    $('form').on('cocoon:after-remove',function(e,deliver_line){
        computeTotal();
    });
    $('form').on('cocoon:after-insert', function(e, order_line){
        // $('select').material_select();
        order_line.find('select').addClass('ajax_field');
        order_line.find('select').addClass('browser-default');
        order_line.find('select').attr('field_number',field_number);
        order_line.find('.numeric').addClass('nested_input '+ field_number);
        order_line.find('.numeric').attr('field_number', field_number);
        field_number++;
        $('.ajax_field').change(function(){
            var select = $(this);
            var number = select.attr('field_number');
            $.getJSON('/apis/products?id=' + this.value, function(product){
                var quantity = document.getElementsByClassName("nested_input "+number)[0].value;
                var line_total = document.getElementsByClassName("nested_input "+number)[1]
                console.log(number + product);
                console.log(product.error)
                if (product.error == undefined){
                    if (quantity <= product.quantity){
                        document.getElementsByClassName("nested_input "+number)[1].value =  quantity * parseFloat(product.price);
                        computeTotal();
                    } else {
                        document.getElementsByClassName("nested_input "+number)[1].value = "";
                        computeTotal();
                        alert("No more stocks");
                    }
                } else {
                    document.getElementsByClassName("nested_input "+number)[1].value = "";
                    computeTotal();
                }
            });
        });
        $('.nested_input').keyup(function(){
            var field_number = this.getAttribute('field_number');
            var select = $('[field_number='+field_number+']');
            var number = select.attr('field_number');
            console.log(select.val());
            $.getJSON('/apis/products?id=' + select.val() , function(product){
                // console.log(number);
                var quantity = document.getElementsByClassName("nested_input "+number)[0].value;
                var line_total = document.getElementsByClassName("nested_input "+number)[1];
                if(product.error == undefined){
                    if (quantity <= product.quantity){
                        document.getElementsByClassName("nested_input "+number)[1].value =  quantity * parseFloat(product.price);
                        computeTotal();
                    } else {
                        document.getElementsByClassName("nested_input "+number)[1].value = "";
                        computeTotal();
                        alert("No more stocks");
                    }
                } else {
                    document.getElementsByClassName("nested_input "+number)[1].value = "";
                    computeTotal();
                }
            });
        });
    });

    function computeTotal() {
        var total_items = $('#order_total_quantity');
        var total_price = $('#order_total_price');
        var nested_inputs = document.getElementsByClassName('nested_input');
        var quantityTotal = 0;
        var priceTotal = 0;
        var iterator = 1;
        for(var i = 0; i < nested_inputs.length; i++){
            if (iterator === 1){
                quantityTotal += parseInt(nested_inputs[i].value);
            } else if (iterator === 2) {
                priceTotal += parseFloat(nested_inputs[i].value);
            }
            iterator++;
            if (iterator == 3) {
                iterator = 0;
            }
        }
        total_items.val(quantityTotal);
        total_price.val(priceTotal);
    }
});