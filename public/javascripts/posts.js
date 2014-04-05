var Posts = {

    dropdown_menu : function(el){
        html = '<ul class="menu">';
        html += '<li><a onclick="return Posts.pop_img_upload_dialog(this);" href="#">上传</a></li>';
        html += '</ul>';

        $(el).jDialog({
            title_visiable : false,
            width : 160,
            class_name : "dropdown_menu",
            top_offset : -2,
            content : html
        });
        $(el).attr("droped",1);
        return false;
    },

    pop_img_upload_dialog : function(el){
        jDialog.close();
        $.facebox({ div : "#post_img_upload", overlay : false });
    },

    upload_img : function(el){
//        var f = $('.img_input').val();
//        alert(f);
        el.form.submit();
        $.facebox.close();
        return false;
    },

    version : function(){
    }

};