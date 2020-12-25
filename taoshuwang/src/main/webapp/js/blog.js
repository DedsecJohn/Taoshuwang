//复选框操作
$('#father').click(function () {
    alert(1111)
    if($(this).prop('checked')){
        //反选
        $(".son").each(function () {
            //attr:自定义属性 prop:固有属性
            $(this).prop('checked',true);
        });
    }else{
        //全选
        $(".son").each(function () {
            //attr:自定义属性 prop:固有属性
            $(this).prop('checked',false);
        });
    }
});
//根据son判断father是否勾中
$('.son').each(function () {
    $(this).click(function () {
        if($('.son:checked').length == $('.son').length){
            $('#father').prop('checked',true);
        }else {
            $('#father').prop('checked',false);
        }
        console.log(count);
    });
});