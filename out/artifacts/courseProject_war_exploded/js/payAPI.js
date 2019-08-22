function weChatShow() {
    $('#aliPayPicture').hide();
    $('#weChatPicture').show();
}
function aliPayShow() {
    $('#aliPayPicture').show();
    $('#weChatPicture').hide();
}
function textareaJustify() {
    if ($('#user_address').val() == "") {
        alert('请输入收货地址！');
        return false;
    }
}
function updateTextareaJustify() {
    if ($('#user_address_another').val() == ""){
        alert('请输入收货地址！'+$('#user_address_another').val());
        return false;
    }

}
