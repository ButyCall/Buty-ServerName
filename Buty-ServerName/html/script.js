$(function () {
    function display(bool) {
        if (bool) {
            document.getElementById("body").style.display="block";
            $(".changueheader").hide();
        } else {
            document.getElementById("body").style.display="none";
        }
    }

    display(false)

    window.addEventListener('message', function(event) {
        var item = event.data;
        if (item.type === "ui") {
            if (item.status == true) {
                display(true)
                $("#nameserver").text(item.nameserver);
                $("#nameserver2").text(item.nameserver2);
            } else {
                display(false)
            }
            if (item.top == true) {
                $(".headertop").show();
                $(".header").hide();
            } else {
                $(".header").show();
                $(".headertop").hide();
            }
            if (item.top == true) {
                $(".headertop").show();
                $(".header").hide();
            } else {
                $(".header").show();
                $(".headertop").hide();
            }
        }if (item.type === "player") {
            $('.player').html(item.players+'/'+item.max)
            if (item.staff > 0) {
                $("#staff").text("ONLINE");
              } else {
                $("#staff").text("OFFLINE");
            }
            if (item.staff > 0) {
                $("#staff2").text("ONLINE");
              } else {
                $("#staff2").text("OFFLINE");
            }
        }if (item.type === "change") {
            display(true)
            $("#nameserver").text(item.nameserver);
            $("#nameserver2").text(item.nameserver2);
            $(".header").css("opacity", "0.5")
            $(".headertop").css("opacity", "0.5")
            $(".changueheader").show();
            $(".header").show();
            $(".headertop").show();
            $(".header").click(function(){
                $(".headertop").hide();
                $(".changueheader").hide();
                $(".header").css("opacity", "1.0")
                $.post('https://Buty-ServerName/exit2', JSON.stringify({}));
        });
        $(".headertop").click(function(){
                $(".header").hide();
                $(".changueheader").hide();
                $(".headertop").css("opacity", "1.0")
                $.post('https://Buty-ServerName/exit2', JSON.stringify({}));
        });
        }
    })
    
    document.onkeyup = function (data) {
        if (data.which == 27) {
            $.post('https://Buty-ServerName/exit', JSON.stringify({}));
            return
        }
    };
        
})  




var clock = new Vue({
    el: '#clock',
    data: {
        time: '',
        date: ''
    }
});

var clock2 = new Vue({
    el: '#clock2',
    data: {
        time: '',
        date: ''
    }
});

var timerID = setInterval(updateTime, 1000);
updateTime();
function updateTime() {
    var cd = new Date();
    clock.time = zeroPadding(cd.getHours(), 2) + ':' + zeroPadding(cd.getMinutes(), 2) + ':' + zeroPadding(cd.getSeconds(), 2);
  
    clock2.time = zeroPadding(cd.getHours(), 2) + ':' + zeroPadding(cd.getMinutes(), 2) + ':' + zeroPadding(cd.getSeconds(), 2);
    clock2.date = zeroPadding(cd.getDate(), 2) + '.' + zeroPadding(cd.getMonth()+1, 2) + '.' + zeroPadding(cd.getFullYear(), 4);
    clock.date = zeroPadding(cd.getDate(), 2) + '.' + zeroPadding(cd.getMonth()+1, 2) + '.' + zeroPadding(cd.getFullYear(), 4);
};

function zeroPadding(num, digit) {
    var zero = '';
    for(var i = 0; i < digit; i++) {
        zero += '0';
    }
    return (zero + num).slice(-digit);
}