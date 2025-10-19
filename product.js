function ShowDesc(){
    var DescImg=document.getElementById("desc_img_0");
    var DescImg1=document.getElementById("desc_img_1");
    var DescImg2=document.getElementById("desc_img_2");
    var DescImg3=document.getElementById("desc_img_3");
    var DescImg4=document.getElementById("desc_img_4");
    DescImg1.addEventListener("click",function(){
        DescImg.src="assets/acer_shadow_desc_img2.png";
    });
    DescImg2.addEventListener("click",function(){
        DescImg.src="assets/acer_shadow_desc_img3.png";
    });
        DescImg3.addEventListener("click",function(){
        DescImg.src="assets/acer_sadow_desc_img4.png";
    });
        DescImg4.addEventListener("click",function(){
        DescImg.src="assets/acer_sadow_desc_img5.png";
    });
}
function CountTime(){
     let endDate=new Date("Dec 31,2025 23:59:59").getTime();
     let x=setInterval(function(){
        let now=new Date().getTime();
        let distance=endDate-now;
        let days=Math.floor(distance/(1000*60*60*24));
        let hours=Math.floor((distance%(1000*60*60*24))/(1000*60*60));
        let minutes=Math.floor((distance%(1000*60*60))/(1000*60));
        let seconds=Math.floor((distance%(1000*60))/1000);
        document.getElementById("counttime").innerHTML=""+
        days+" Ngày "+hours+" Giờ "+minutes+" Phút "+seconds+" Giây ";
        if(distance<0){
        clearInterval(x);
        document.getElementById("counttime").innerHTML="hết hạn";
       }
    },1000)
}

// phần tính tổng tiền khi mua thêm phụ kiện
function totalPrice(){
    var earphone=document.getElementById("earphone").checked;
    var keyboard=document.getElementById("keyboard").checked;
    var mouse=document.getElementById("mouse").checked;
    var ram=document.getElementById("RAM").checked;
    var monitor=document.getElementById("monitor").checked;


    localStorage.setItem("earphone",earphone);
    localStorage.setItem("keyboard",keyboard);
    localStorage.setItem("mouse",mouse);
    localStorage.setItem("ram",ram);
    localStorage.setItem("monitor",monitor);
}
function attachCheckboxListeners() {
    document.getElementById("earphone").addEventListener("change", totalPrice);
    document.getElementById("keyboard").addEventListener("change", totalPrice);
    document.getElementById("mouse").addEventListener("change", totalPrice);
    document.getElementById("RAM").addEventListener("change", totalPrice);
    document.getElementById("monitor").addEventListener("change", totalPrice);
}


function init(){
    ShowDesc();
    CountTime();
    totalPrice();
    attachCheckboxListeners() 
}
window.onload=init;