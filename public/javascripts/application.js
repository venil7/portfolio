$(function(){
    if ($(".flash_notice").size()) {
        $.pnotify($(".flash_notice").html()/*{
                pnotify_text: $(".flash_notice").html(),
                pnotify_nonblock: true,
                pnotify_nonblock_opacity: .2
            }*/);
    }
});
