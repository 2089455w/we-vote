  $(document).ready(function(){
        $('#comment').click(function(){
            $('#text').show()
        }
        )
        $(document).on("click", '.reply', function(){
            $(this).after($('#text').show())
            var id = $(this).parent().attr('id')
            $('#comment_parent_comment_id').val(id)  
        })
        
        for (var i= 0; i < gon.comments.length; i++){
            if (gon.comments[i].parent_comment_id != 'nil'){
                $('#'+gon.comments[i].parent_comment_id).after("<div style='border: 1px solid black' id = "+ i.toString() +">" + gon.comments[i].content
            +"<button class='reply'>Reply</button></div>")
            }
            
        }
    
        
    })
    